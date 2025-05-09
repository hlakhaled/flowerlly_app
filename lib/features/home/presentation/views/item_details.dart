import 'package:flowerlly_app/features/home/presentation/views/widgets/item_details_body.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});
  static String id = "item";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ItemDetailsBody()),
    );
  }
}
