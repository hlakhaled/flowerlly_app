import 'package:flowerlly_app/constants/all_colors.dart';

import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/home/presentation/views/item_details.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ItemDetails.id);
      },
      child: Container(
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
            Center(
                child: Image.asset(
              Assets.assetsImagesRosesss,
              width: 90,
              height: 90,
            )),
            const Spacer(
              flex: 1,
            ),
            Center(
              child: Text(
                "101 red roses",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle12.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
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
