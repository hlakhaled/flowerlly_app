import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/functions/background_image.dart';
import 'package:flowerlly_app/core/utils/functions/shared_preference_func.dart';

import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/account/presentation/widget/custom_account_bottom_sheet.dart';
import 'package:flowerlly_app/features/favourit/presentation/widgets/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class AccountBody extends StatefulWidget {
  const AccountBody({super.key});

  @override
  State<AccountBody> createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  String userName = '...'; // Placeholder text

  @override
  void initState() {
    super.initState();
    loadUserName();
  }

  Future<void> loadUserName() async {
    String name = await SharedPreferenceFunc.getName();
    setState(() {
      userName = name;
      print(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return backgroundImage(
      child: Column(
        children: [
          SizedBox(height: AppSize.height(context) * .06),
          const CustomAppBar(text: "Profile"),
          SizedBox(height: AppSize.height(context) * .04),
          // Avatar section (unchanged)
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                color: AllColors.kWhiteColor,
                height: 140,
                width: 140,
              ),
            ),
            Positioned(
              top: AppSize.height(context) * .13,
              left: AppSize.height(context) * .13,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AllColors.kWhiteColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: AllColors.kGrey2Color,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            Positioned(
              top: AppSize.height(context) * .14,
              left: AppSize.height(context) * .145,
              child: SvgPicture.asset(
                Assets.assetsImagesPencil,
                width: 20,
                height: 20,
              ),
            )
          ]),
          SizedBox(height: AppSize.height(context) * .02),
          Text(
            userName, // Displays the loaded name
            style: Styles.textStyle32.copyWith(
              fontWeight: FontWeight.bold,
              color: AllColors.kGreenColor,
            ),
          ),
          SizedBox(height: AppSize.height(context) * .04),
          const CustomAccountBottomSheet(),
        ],
      ),
    );
  }
}
