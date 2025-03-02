import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/core/utils/common_widgets/custom_button.dart';
import 'package:flowerlly_app/core/utils/common_widgets/custom_text_field.dart';
import 'package:flowerlly_app/core/utils/functions/shared_preference_func.dart';

import 'package:flowerlly_app/core/utils/functions/signup.dart';
import 'package:flowerlly_app/core/utils/functions/snack_bar.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/regesteration/data/models/user_auth.dart';

import 'package:flutter/material.dart';

class SignUpCustomBottomSheet extends StatefulWidget {
  const SignUpCustomBottomSheet({super.key});

  @override
  _SignUpCustomBottomSheetState createState() =>
      _SignUpCustomBottomSheetState();
}

class _SignUpCustomBottomSheetState extends State<SignUpCustomBottomSheet> {
  double _position = 1.0;

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _confirmPassword;
  late UserAuth _userAuth;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _lastName = TextEditingController();
    _firstName = TextEditingController();
    _confirmPassword = TextEditingController();

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
    return Column(
      children: [
        Expanded(
          child: Padding(
              padding: EdgeInsets.only(
                  left: 13, right: 13, top: AppSize.height(context) * .1),
              child: AnimatedContainer(
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
                          Text("Sign Up", style: Styles.textStyle26),
                          SizedBox(height: AppSize.height(context) * .05),
                          CustomTextField(
                            text: "First Name",
                            controller: _firstName,
                          ),
                          SizedBox(height: AppSize.height(context) * .024),
                          CustomTextField(
                            text: "Last Name",
                            controller: _lastName,
                          ),
                          SizedBox(height: AppSize.height(context) * .024),
                          CustomTextField(
                            text: "Email Address",
                            controller: _email,
                          ),
                          SizedBox(height: AppSize.height(context) * .024),
                          CustomTextField(
                            text: "Password",
                            controller: _password,
                          ),
                          SizedBox(height: AppSize.height(context) * .024),
                          CustomTextField(
                            text: "Confirm Password",
                            controller: _confirmPassword,
                          ),
                          SizedBox(height: AppSize.height(context) * .05),
                          CustomButton(
                            text: "Sign Up",
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _userAuth = UserAuth(
                                    email: _email.text,
                                    password: _password.text,
                                    fullName:
                                        "${_firstName.text} ${_lastName.text}");

                                _password.text != _confirmPassword.text
                                    ? showInSnackBar(
                                        "Please ensure your password matches the confirmation.",
                                        context)
                                    : {
                                        signup(
                                          user: _userAuth,
                                          context: context,
                                        ),
                                        SharedPreferenceFunc.setName(
                                            "${_firstName.text} ${_lastName.text}"),
                                        SharedPreferenceFunc.set(true),
                                      };
                              }
                            },
                          ),
                          SizedBox(height: AppSize.height(context) * .03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have account ? ",
                                style: Styles.textStyle12.copyWith(
                                  color: AllColors.kGreenColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Log in",
                                  style: Styles.textStyle12.copyWith(
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
              )),
        ),
      ],
    );
  }
}
