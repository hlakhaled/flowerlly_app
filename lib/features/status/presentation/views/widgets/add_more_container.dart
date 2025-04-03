import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/constants/assets.dart';

import 'package:flowerlly_app/core/utils/common_widgets/custom_button.dart';

import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/status/domain/entities/status_entity.dart';
import 'package:flowerlly_app/features/status/presentation/managers/add_status/add_status_cubit.dart';
import 'package:flowerlly_app/features/status/presentation/managers/status/status_cubit.dart';

import 'package:flowerlly_app/features/status/presentation/views/widgets/custom_text_field_for_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:intl/intl.dart';

class AddMoreContainer extends StatefulWidget {
  const AddMoreContainer({
    super.key,
  });

  @override
  State<AddMoreContainer> createState() => _AddMoreContainerState();
}

class _AddMoreContainerState extends State<AddMoreContainer> {
  late TextEditingController _title;
  late TextEditingController _desc;
  late TextEditingController _date;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _title = TextEditingController();
    _desc = TextEditingController();
    _date = TextEditingController();

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

  Future<dynamic> customDialog(BuildContext parentContext) {
    return showDialog(
        context: parentContext,
        builder: (parentContext) => Dialog(
              surfaceTintColor: AllColors.kContainerColor,
              shadowColor: AllColors.kGreenColor,
              backgroundColor: AllColors.kContainerColor,
              child: SizedBox(
                width: AppSize.width(parentContext) * .99,
                height: AppSize.height(parentContext) * .6,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppSize.width(parentContext) * .06,
                    top: AppSize.height(parentContext) * .06,
                    right: AppSize.width(parentContext) * .06,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: AppSize.height(parentContext) * .01),
                      CustomTextFieldForDialog(
                          num: 1, text: "Add Title", controller: _title),
                      SizedBox(height: AppSize.height(parentContext) * .028),
                      Text(
                        "Description",
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: AppSize.height(parentContext) * .01),
                      CustomTextFieldForDialog(
                          num: 4, text: "Add Description", controller: _desc),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSize.width(parentContext) * .12),
                        child: CustomButton(
                            text: "Save",
                            onPressed: () {
                              DateTime now = DateTime.now();
                              _date.text = formatDateTime(now);
                              StatusEntity status = StatusEntity(
                                  title: _title.text,
                                  description: _desc.text,
                                  date: _date.text);

                              parentContext
                                  .read<AddStatusCubit>()
                                  .addStaus(status);
                              parentContext.read<StatusCubit>().fetchStatus();
                            }),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ));
  }
}

String formatDateTime(DateTime dateTime) {
  String formattedTime = DateFormat('h:mma').format(dateTime); // 10:00AM
  String formattedDate =
      DateFormat(" - MMMM dd, yyyy").format(dateTime); // - July 05, 2023
  return formattedTime + formattedDate;
}
