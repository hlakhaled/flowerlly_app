import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flutter/material.dart';

void showInSnackBar(String value, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(value),
    backgroundColor: AllColors.kGreenColor,
  ));
}
