import 'package:flowerlly_app/features/regesteration/presentation/login_screen.dart';
import 'package:flowerlly_app/features/regesteration/presentation/signup_screen.dart';
import 'package:flowerlly_app/features/splash_screen/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SignupScreen.id: (context) => const SignupScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        SplashScreen.id: (context) => const SplashScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
