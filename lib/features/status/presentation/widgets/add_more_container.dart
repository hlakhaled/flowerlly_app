import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/common_widgets/custom_button.dart';

import 'package:flowerlly_app/core/utils/styles.dart';

import 'package:flowerlly_app/features/status/presentation/widgets/custom_text_field_for_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddMoreContainer extends StatefulWidget {
  const AddMoreContainer({
    super.key,
  });

  @override
  State<AddMoreContainer> createState() => _AddMoreContainerState();
}

class _AddMoreContainerState extends State<AddMoreContainer> {
  late TextEditingController _title;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _title = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
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
            onPressed: () {
              customDialog(context);
            },
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
      ),
    );
  }

  Future<dynamic> customDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => Dialog(
              surfaceTintColor: AllColors.kContainerColor,
              shadowColor: AllColors.kGreenColor,
              backgroundColor: AllColors.kContainerColor,
              child: SizedBox(
                width: AppSize.width(context) * .99,
                height: AppSize.height(context) * .6,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppSize.width(context) * .06,
                    top: AppSize.height(context) * .06,
                    right: AppSize.width(context) * .06,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: AppSize.height(context) * .01),
                      CustomTextFieldForDialog(
                          num: 1, text: "Order delivered", controller: _title),
                      SizedBox(height: AppSize.height(context) * .028),
                      Text(
                        "Description",
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: AppSize.height(context) * .01),
                      CustomTextFieldForDialog(
                          num: 4, text: "Order delivered", controller: _title),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSize.width(context) * .12),
                        child: CustomButton(text: "Save", onPressed: () {}),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ));
  }
}
