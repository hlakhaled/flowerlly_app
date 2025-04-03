import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';

import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/home/data/models/description_of_plant_model.dart';
import 'package:flutter/material.dart';

class CustomContainerItem extends StatelessWidget {
  final DescriptionOfPlantModel descriptionOfPlantModel;
  const CustomContainerItem({
    super.key,
    required this.descriptionOfPlantModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AllColors.kGrey2Color,
          )),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 14,
          top: 14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: AllColors.kLightGreenColor, shape: BoxShape.circle),
              child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: descriptionOfPlantModel.icon),
            ),
            SizedBox(height: AppSize.height(context) * .014),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                descriptionOfPlantModel.title,
                style: Styles.textStyle13.copyWith(
                    color: AllColors.kBlackColor, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: AppSize.height(context) * .006),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                descriptionOfPlantModel.description,
                style: Styles.textStyle12.copyWith(
                    fontWeight: FontWeight.w300, color: AllColors.kBlackColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
