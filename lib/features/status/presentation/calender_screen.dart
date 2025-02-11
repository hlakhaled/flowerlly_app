import 'package:flowerlly_app/features/status/presentation/widgets/calender_body_screen.dart';
import 'package:flutter/material.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});
  static String id = "calender";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: CalenderBodyScreen()));
  }
}
