import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.controller,
  });

  final String text;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AllColors.kGreenColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Required";
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: Styles().textStyle16Inter,
        enabledBorder: outlineInputBorder(),
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(true),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder([bool isFocus = false]) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: isFocus ? AllColors.kGreenColor : AllColors.kLightGreenColor,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
