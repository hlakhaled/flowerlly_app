// ignore: file_names
import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flutter/material.dart';

class ItemInList extends StatefulWidget {
  const ItemInList({super.key});

  @override
  State<ItemInList> createState() => _ItemInListState();
}

class _ItemInListState extends State<ItemInList> {
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
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 28, bottom: 18),
            child: Image.asset(Assets.assetsImagesRosesss),
          ),
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
