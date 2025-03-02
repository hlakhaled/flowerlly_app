import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/favourit/presentation/widgets/item_in%20_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HorizontalItemInList extends StatelessWidget {
  const HorizontalItemInList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const ItemInList(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.height(context) * .03,
                ),
                Text(
                  "101 red roses ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style:
                      Styles.textStyle20.copyWith(color: AllColors.kBlackColor),
                ),
                SizedBox(
                  width: 125,
                  height: 59,
                  child: Text(
                    "Available injjjjjjjjjjjj stockkkkkkkkkkkmmmmmmmcccccccccsssssssssccccccccc........",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: Styles.textStyle12Inter,
                  ),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: AppSize.height(context) * .03,
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.assetsImagesTrash)),
              ],
            )
          ],
        ),
        SizedBox(
          height: AppSize.height(context) * .03,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Container(
            color: AllColors.kLightGreenColor,
            height: 1,
          ),
        ),
        SizedBox(
          height: AppSize.height(context) * .03,
        ),
      ],
    );
  }
}
