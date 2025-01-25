import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/core/utils/common_widgets/custom_button.dart';
import 'package:flowerlly_app/core/utils/common_widgets/custom_text_field.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/regesteration/presentation/signup_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  double _position = 1.0;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _email;
  late TextEditingController _password;

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
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSize.height(context) * .06),
                    Text("Log in", style: Styles().textStyle26),
                    SizedBox(height: AppSize.height(context) * .05),
                    CustomTextField(
                      text: "Email Address",
                      controller: _email,
                    ),
                    SizedBox(height: AppSize.height(context) * .024),
                    CustomTextField(
                      text: "Password",
                      controller: _password,
                    ),
                    SizedBox(height: AppSize.height(context) * .09),
                    CustomButton(
                      text: "Log in",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                    ),
                    SizedBox(height: AppSize.height(context) * .03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account ? ",
                          style: Styles().textStyle12.copyWith(
                                color: AllColors.kGreenColor,
                              ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SignupScreen.id);
                          },
                          child: Text(
                            "Sign up",
                            style: Styles().textStyle12.copyWith(
                                  color: AllColors.kGreenColor,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AllColors.kGreenColor,
                                ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
