
import 'package:flowerlly_app/core/utils/functions/background_image.dart';

import 'package:flowerlly_app/features/regesteration/presentation/widgets/sign_up_custom_bottom_sheet.dart';
import 'package:flutter/material.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return backgroundImage(child: const SignUpCustomBottomSheet());
  }
}
