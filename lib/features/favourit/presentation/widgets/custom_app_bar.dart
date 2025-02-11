import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, this.isBack = false});
  final String text;
  final bool isBack;
  @override
  Widget build(BuildContext context) {
    return isBack
        ? Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(Assets.assetsImagesBack)),
              const Spacer(
                flex: 3,
              ),
              Text(
                text,
                style: Styles.textStyle36,
              ),
              const Spacer(
                flex: 4,
              ),
            ],
          )
        : Center(
            child: Text(
              text,
              style: Styles.textStyle36,
            ),
          );
  }
}
