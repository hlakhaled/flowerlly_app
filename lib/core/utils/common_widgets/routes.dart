import 'package:flowerlly_app/features/account/presentation/account_screen.dart';
import 'package:flowerlly_app/features/bottom_nav_bar/presentation/bottom_nav_bar.dart';
import 'package:flowerlly_app/features/home/presentation/home_screen.dart';
import 'package:flowerlly_app/features/home/presentation/item_details.dart';
import 'package:flowerlly_app/features/regesteration/presentation/login_screen.dart';
import 'package:flowerlly_app/features/regesteration/presentation/signup_screen.dart';
import 'package:flowerlly_app/features/splash_screen/presentation/splash_screen.dart';
import 'package:flowerlly_app/features/status/presentation/calender_screen.dart';
import 'package:flowerlly_app/features/status/presentation/status_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> get Routes {
  return {
      ItemDetails.id: (context) => const ItemDetails(),
    SignupScreen.id: (context) => const SignupScreen(),
    LoginScreen.id: (context) => const LoginScreen(),
    SplashScreen.id: (context) => const SplashScreen(),
    HomeScreen.id: (context) => const HomeScreen(),
    BottomNavBar.id: (context) => const BottomNavBar(),
    AccountScreen.id: (context) => const AccountScreen(),
    StatusScreen.id: (context) => const StatusScreen(),
    CalenderScreen.id: (context) => const CalenderScreen()
  };
}
