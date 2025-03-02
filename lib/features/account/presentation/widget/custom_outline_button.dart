import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/core/utils/functions/shared_preference_func.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/regesteration/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/assets.dart';

class CustomOutlineButton extends StatelessWidget {
  final int num;

  CustomOutlineButton({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        "icon": Assets.assetsImagesSignout,
        "text": "Sign Out",
        "func": () {
          SharedPreferenceFunc.set(false);
          Navigator.pushNamedAndRemoveUntil(
              context, LoginScreen.id, (route) => false);
        }
      },
      {"icon": Assets.assetsImagesInfo, "text": "About us", "func": () {}},
      {"icon": Assets.assetsImagesSetting, "text": "Setting", "func": () {}},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.width(context) * .04),
      child: OutlinedButton(
        onPressed: items[num]["func"],
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
