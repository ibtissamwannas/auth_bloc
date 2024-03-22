import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_login_ui/bloc/auth_bloc.dart';
import 'package:flutter_responsive_login_ui/login_screen.dart';
import 'package:flutter_responsive_login_ui/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final authState = context.watch<AuthBloc>().state as AuthSuccess;
    // app bar will rebuild when authState changes
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          // final authState = context.watch<AuthBloc>().state as AuthSuccess;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text((state is AuthSuccess) ? state.uid : ""),
              if (state is AuthLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (state is! AuthLoading)
                GradientButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthLogoutButtonPressed());
                  },
                )
            ],
          );
        },
      ),
    );
  }
}
