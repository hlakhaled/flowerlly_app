import 'package:flowerlly_app/features/regesteration/presentation/widgets/signup_body.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  static String id = "signup";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: SignupBody()),
    );
  }
}
