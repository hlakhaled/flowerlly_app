import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ItemInGridView extends StatefulWidget {
  const ItemInGridView({
    super.key,
  });

  @override
  State<ItemInGridView> createState() => _ItemInGridViewState();
}

class _ItemInGridViewState extends State<ItemInGridView> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AllColors.kLightGreenColor, width: 1.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  isPressed == true ? isPressed = false : isPressed = true;
                });
              },
              icon: isFaverouit()),
          Center(child: Image.asset(Assets.assetsImagesRosesss)),
          Center(
            child: Text(
              "101 red roses",
              style: Styles.textStyle12.copyWith(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget isFaverouit() {
    if (isPressed == true) {
      return const Icon(
        Icons.favorite,
        color: AllColors.kGreenColor,
      );
    } else {
      return const Icon(
        Icons.favorite_border,
        color: AllColors.kGreenColor,
      );
    }
  }
}
