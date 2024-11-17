import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_api/auth/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF4A90E2), // Warna biru utama
        elevation: 4.0, // Bayangan ringan pada AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 28),
            onPressed: () {
              // Tambahkan aksi untuk profil atau pengaturan
            },
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFE3F2FD), // Latar belakang biru muda
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) {
                      final user = context.select(
                        (AuthCubit auth) => auth.state.user,
                      );
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Pesan selamat datang
                          Container(
                            margin: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              'Welcome, ${user?.name ?? "Guest"}!',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF4A90E2),
                                    fontSize: 28,
                                  ),
                            ),
                          ),

                          // Kartu informasi pengguna
                          Card(
                            elevation: 12.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: Colors.white,
                            shadowColor: Colors.black.withOpacity(0.2),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User ID: ${user?.accountId ?? "N/A"}',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    'Name: ${user?.name ?? "N/A"}',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    'Balance: ${user?.balance ?? "0"}',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 30.0),

                  // Tombol navigasi
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/wiseword');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A90E2),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      elevation: 8.0,
                    ),
                    child: const Text(
                      "Go to Wise Word",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 15.0),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/counter');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A90E2),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      elevation: 8.0,
                    ),
                    child: const Text(
                      "Go to Counter",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 30.0),

                  // Tombol logout
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().logout();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A90E2),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      elevation: 8.0,
                    ),
                    child: const Text(
                      "Logout",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
