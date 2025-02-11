
import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddMoreContainer extends StatelessWidget {
  const AddMoreContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppSize.width(context) * .54,
          right: AppSize.width(context) * .08),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: AllColors.kLightGreenColor,
            side: const BorderSide(
              width: 1.5,
              color: AllColors.kGreenColor,
            ),
          ),
          onPressed: () {},
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(Assets.assetsImagesPlus),
                SizedBox(
                  width: AppSize.width(context) * .02,
                ),
                Text(
                  "Add More",
                  style: Styles.textStyle12.copyWith(
                      color: AllColors.kGreenColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
    );
  }
}
