import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/core/utils/functions/background_image.dart';
import 'package:flowerlly_app/features/favourit/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: backgroundImage(
              child: Column(
            children: [
              SizedBox(
                height: AppSize.height(context) * .06,
              ),
              const CustomAppBar(
                text: "Flowerly",
              ),
              SizedBox(
                height: AppSize.height(context) * .07,
              ),
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
//                     child: Container(
//                       decoration: const BoxDecoration(
// border: outli
//                       ),
//                       // color: AllColors.kGrey2Color,
//                       height: 40,
//                       width: 40,
//                     ),
                  ),
                ),
              ]),
            ],
          )),
        ),
      ],
    );
  }
}
