import 'package:flowerlly_app/features/account/presentation/widget/account_body.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  static String id = "Account";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AccountBody()),
    );
  }
}
