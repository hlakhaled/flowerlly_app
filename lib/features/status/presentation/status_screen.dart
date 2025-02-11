import 'package:flowerlly_app/features/status/presentation/widgets/status_body_screen.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});
  static String id = "status";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: StatusBodyScreen()));
  }
}
