import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/features/favourit/presentation/widgets/custom_app_bar.dart';
import 'package:flowerlly_app/features/home/presentation/views/widgets/custom_details_bottom_sheet.dart';

import 'package:flutter/material.dart';

class ItemDetailsBody extends StatelessWidget {
  const ItemDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: AppSize.height(context) * .06,
        ),
        const CustomAppBar(
          text: "Flowerly",
          isBack: true,
        ),
        SizedBox(
          height: AppSize.height(context) * .01,
        ),
        Center(
            child: Image.asset(
          Assets.assetsImagesFlower2,
          width: 274,
          height: 270,
        )),
        SizedBox(height: AppSize.height(context) * .04),
        const CustomDetatilsBottomSheet()
      ],
    );
  }
}
