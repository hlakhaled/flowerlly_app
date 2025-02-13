import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/assets.dart';

class CustomOutlineButton extends StatelessWidget {
  final int num;
  final List<Map<String, dynamic>> items = const [
    {"icon": Assets.assetsImagesSignout, "text": "Sign Out"},
    {"icon": Assets.assetsImagesInfo, "text": "About us"},
    {"icon": Assets.assetsImagesSetting, "text": "Setting"},
  ];
  const CustomOutlineButton({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.width(context) * .04),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AllColors.kLightGreenColor, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                items[num]["icon"], width: 18,
                // ignore: deprecated_member_use
                color: AllColors.kGreenColor,
              ),
              SizedBox(width: AppSize.width(context) * .03),
              Text(items[num]["text"],
                  style: Styles.textStyle20.copyWith(
                      color: AllColors.kGreenColor,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
