import 'package:flowerlly_app/constants/app_size.dart';

import 'package:flowerlly_app/core/utils/functions/background_image.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/regesteration/presentation/widgets/custom_bottom_sheet.dart';

import 'package:flutter/material.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return backgroundImage(
        child: Padding(
      padding: EdgeInsets.only(top: AppSize.height(context) * .14),
      child: Column(
        children: [
          Center(
            child: Text(
              "Flowerfly",
              style: Styles().textStyle36,
            ),
          ),
          SizedBox(
            height: AppSize.height(context) * .09,
          ),
          const CustomBottomSheet()
        ],
      ),
    ));
  }
}
