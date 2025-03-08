import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/constants/assets.dart';

import 'package:flowerlly_app/core/utils/functions/shared_preference_func.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/home/presentation/widgets/custom_container_item.dart';
import 'package:flowerlly_app/features/home/presentation/widgets/custom_container_list.dart';

import 'package:flutter/material.dart';

class CustomDetatilsBottomSheet extends StatefulWidget {
  const CustomDetatilsBottomSheet({super.key});

  @override
  _CustomDetatilsBottomSheetState createState() =>
      _CustomDetatilsBottomSheetState();
}

class _CustomDetatilsBottomSheetState extends State<CustomDetatilsBottomSheet> {
  double _position = 1.0;

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _email;
  late TextEditingController _password;
  CollectionReference user = FirebaseFirestore.instance.collection("Users");
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _position = 0.0;
      });
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> loadName() async {
    String id = await SharedPreferenceFunc.getId();

    DocumentSnapshot<Object?> snapshot = await user.doc(id).get();
    if (snapshot.exists) {
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

      String name = data?['Name'] ?? '...';
      await SharedPreferenceFunc.setName(name);
      await SharedPreferenceFunc.set(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AllColors.kWhiteColor,
          border: Border.all(color: AllColors.kLightGreenColor, width: 2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(
            0, _position * AppSize.height(context), 0),
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, top: 14),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.height(context) * .04),
                  AutoSizeText(
                    "Abies alba “European Silver Fir”",
                    maxLines: 4,
                    style: Styles.textStyle24,
                  ),
                  SizedBox(height: AppSize.height(context) * .03),
                  Text(
                    "Description :",
                    style: Styles.textStyle16.copyWith(
                        color: AllColors.kBlackColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: AppSize.height(context) * .001),
                  AutoSizeText(
                    "Amazing garden plant that is sure to capture attention...",
                    maxLines: 4,
                    style: Styles.textStyle12.copyWith(
                        color: AllColors.kBlackColor,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: AppSize.height(context) * .024),
                  Text(
                    "Composition: ",
                    style: Styles.textStyle16.copyWith(
                        color: AllColors.kBlackColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: AppSize.height(context) * .001),
                  AutoSizeText(
                    "leaves , branches ,twigs ",
                    maxLines: 4,
                    style: Styles.textStyle12.copyWith(
                        color: AllColors.kBlackColor,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: AppSize.height(context) * .024),
                  Text(
                    "sunlight: ",
                    style: Styles.textStyle16.copyWith(
                        color: AllColors.kBlackColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: AppSize.height(context) * .001),
                  AutoSizeText(
                    "Sunlight is the most important environmental factor controlling the growth and health of European silver fir (Abies alba).",
                    maxLines: 4,
                    style: Styles.textStyle12.copyWith(
                        color: AllColors.kBlackColor,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: AppSize.height(context) * .024),
                  Text(
                    "watering: ",
                    style: Styles.textStyle16.copyWith(
                        color: AllColors.kBlackColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: AppSize.height(context) * .001),
                  AutoSizeText(
                    "Watering European silver fir trees is essential for them to stay",
                    maxLines: 4,
                    style: Styles.textStyle12.copyWith(
                        color: AllColors.kBlackColor,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: AppSize.height(context) * .04),
                  const Divider(
                    color: AllColors.kLightGreenColor,
                    thickness: 2,
                  ),
                  SizedBox(height: AppSize.height(context) * .04),
                  CustomContainerList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
