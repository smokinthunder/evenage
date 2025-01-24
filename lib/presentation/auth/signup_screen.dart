import 'package:flutter/material.dart';
import 'package:evenage/presentation/auth/widgets/signin_with_google_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SignInWithGoogleButton()),
    );
  }
}
