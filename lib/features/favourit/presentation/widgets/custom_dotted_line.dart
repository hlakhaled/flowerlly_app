import 'package:dotted_line/dotted_line.dart';
import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flutter/material.dart';

class CustomDottedLine extends StatelessWidget {
  const CustomDottedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      lineLength: AppSize.width(context),
      lineThickness: 2.0,
      dashLength: 6.0,
      dashColor: AllColors.kGreenColor,
      dashGapLength: 3.0,
    );
  }
}
