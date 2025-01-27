import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/features/home/presentation/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = "home";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeBody()),
      backgroundColor: AllColors.kBackgroundColor,
    );
  }
}
