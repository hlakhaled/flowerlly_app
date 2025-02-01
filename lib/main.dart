import 'package:flowerlly_app/features/account/presentation/account_screen.dart';
import 'package:flowerlly_app/features/bottom_nav_bar/presentation/bottom_nav_bar.dart';
import 'package:flowerlly_app/features/home/presentation/home_screen.dart';
import 'package:flowerlly_app/features/regesteration/presentation/login_screen.dart';
import 'package:flowerlly_app/features/regesteration/presentation/signup_screen.dart';
import 'package:flowerlly_app/features/splash_screen/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
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
        HomeScreen.id: (context) => const HomeScreen(),
        BottomNavBar.id: (context) => const BottomNavBar(),
        AccountScreen.id: (context) => const AccountScreen()
      },
      initialRoute: BottomNavBar.id,
    );
  }
}
