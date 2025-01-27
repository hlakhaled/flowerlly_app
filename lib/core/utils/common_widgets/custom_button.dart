import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text,required this.onPressed});
  final String text;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AllColors.kGreenColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: Styles.textStyle16,
            ),
          ),
        ));
  }
}
