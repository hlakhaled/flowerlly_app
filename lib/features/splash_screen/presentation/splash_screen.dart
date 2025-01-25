import 'package:flowerlly_app/features/splash_screen/presentation/widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
static String id="splash";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SplashScreenBody()),
    );
  }
}
