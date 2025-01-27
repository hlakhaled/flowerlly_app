import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemInGridView extends StatelessWidget {
  const ItemInGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AllColors.kLightGreenColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 8),
            child: SvgPicture.asset(Assets.assetsImagesLove),
          ),
          Center(child: Image.asset(Assets.assetsImagesRosesss)),
          Center(
            child: Text(
              "101 red roses",
              style: Styles.textStyle12
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
