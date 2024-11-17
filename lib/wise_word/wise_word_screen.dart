import 'package:flutter/material.dart';

class WiseWordScreen extends StatelessWidget {
  const WiseWordScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const WiseWordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wise Word'),
        backgroundColor: const Color(0xFF4A90E2),
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Card untuk menampilkan kata bijak
              Card(
                elevation: 12.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                shadowColor: Colors.black.withOpacity(0.2),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '"Page Wise Word"',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                          color: const Color(0xFF4A90E2),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        'Wise Word',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30.0),

              // Tombol untuk kembali ke halaman home
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A90E2),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  elevation: 8.0,
                  shadowColor: Colors.black.withOpacity(0.3),
                ),
                child: const Text(
                  "Back to Home",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
