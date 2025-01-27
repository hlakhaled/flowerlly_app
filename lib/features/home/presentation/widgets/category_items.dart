import 'package:flowerlly_app/constants/all_colors.dart';

import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 16),
      child: Column(
        children: [
          SizedBox(
            width: 80,
            height: 104,
            child: CircleAvatar(
              backgroundColor: AllColors.kLightGreyColor,
              child: Image.asset(
                Assets.assetsImagesImage,
                width: 60,
                height: 60,
              ),
            ),
          ),
          Text(
            text,
            style: Styles.textStyle12.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
