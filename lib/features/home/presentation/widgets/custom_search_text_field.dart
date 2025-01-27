import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  // final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AllColors.kGreenColor,
      // controller: controller,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.asset(
            Assets.assetsImagesSearch,
          ),
        ),
        hintText: "Search",
        hintStyle: Styles.textStyle16Inter,
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
