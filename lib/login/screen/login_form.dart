import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_api/login/cubit/login_cubit.dart';
import 'package:flutter_login_api/login/models/models.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text("Authentication Failed"),
                  backgroundColor: Colors.red,
                ),
              );
          }
        },
        child: Container(
          color: const Color(0xFFE3F2FD), // Warna biru muda
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF4A90E2),
                              ),
                        ),
                        const SizedBox(height: 20),
                        const InputUsername(),
                        const SizedBox(height: 15),
                        const InputPassword(),
                        const SizedBox(height: 25),
                        const ButtonSubmit(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputUsername extends StatelessWidget {
  const InputUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (value) =>
              context.read<LoginCubit>().usernameChanged(value),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person, color: Color(0xFF4A90E2)),
            labelText: 'Username',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            errorText:
                state.username.displayError == UsernameValidationError.empty
                    ? 'Invalid username'
                    : null,
          ),
        );
      },
    );
  }
}

class InputPassword extends StatelessWidget {
  const InputPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (value) =>
              context.read<LoginCubit>().passwordChanged(value),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock, color: Color(0xFF4A90E2)),
            labelText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            errorText: (() {
              switch (state.password.displayError) {
                case PasswordValidationError.minimumLength:
                  return 'Password minimum 6 characters';
                case PasswordValidationError.empty:
                  return 'Password cannot be empty';
                default:
                  return null;
              }
            })(),
          ),
        );
      },
    );
  }
}

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: () => context.read<LoginCubit>().loginSubmitted(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A90E2),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              );
      },
    );
  }
}
