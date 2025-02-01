import 'package:flowerlly_app/features/favourit/presentation/widgets/favourit_body_screen.dart';
import 'package:flutter/material.dart';

class FavouritScreen extends StatelessWidget {
  const FavouritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: FavouritBodyScreen()),
    );
  }
}
