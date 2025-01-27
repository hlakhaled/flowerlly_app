import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flowerlly_app/core/utils/functions/background_image.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/regesteration/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return backgroundImage(
        child: Center(
      child: AnimatedSplashScreen(
        splash: Text(
          "Flowerfly!",
          style: Styles.textStyle50,
        ),
        nextScreen: const LoginScreen(),
        backgroundColor: Colors.transparent,
        pageTransitionType: PageTransitionType.fade,
      ),
    ));
  }
}
