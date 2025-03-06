import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';

import 'package:flowerlly_app/features/account/presentation/widget/custom_outline_button.dart';

import 'package:flutter/material.dart';

class CustomAccountBottomSheet extends StatefulWidget {
  const CustomAccountBottomSheet({super.key});

  @override
  _CustomAccountBottomSheetState createState() =>
      _CustomAccountBottomSheetState();
}

class _CustomAccountBottomSheetState extends State<CustomAccountBottomSheet> {
  double _position = 1.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _position = 0.0;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: AnimatedContainer(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AllColors.kWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(
              0, _position * AppSize.height(context), 0),
          child: Padding(
            padding: EdgeInsets.only(
                right: AppSize.width(context) * .07,
                left: AppSize.width(context) * .07,
                top: AppSize.height(context) * .05),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Center(
                      child: CustomOutlineButton(
                        num: index,
                      ),
                    ),
                    SizedBox(height: AppSize.height(context) * .02),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
