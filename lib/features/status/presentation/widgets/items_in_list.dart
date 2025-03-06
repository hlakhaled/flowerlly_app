import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemsInList extends StatefulWidget {
  const ItemsInList(
      {super.key,
      required this.index,
      required this.items,
      this.isClose = false});
  final int index;
  final List<String> items;
  final bool isClose;
  @override
  State<ItemsInList> createState() => _ItemsInListState();
}

class _ItemsInListState extends State<ItemsInList> {
  late List<bool> isChecked;
  @override
  void initState() {
    isChecked = List.generate(widget.items.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height(context) * .14,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: AppSize.height(context) * .02,
            ),
            child: Transform.scale(
              scale: 2,
              child: Checkbox(
                shape: const CircleBorder(),
                onChanged: (value) {
                  setState(() {
                    isChecked[widget.index] = value!;
                  });
                },
                value: isChecked[widget.index],
              ),
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.items[widget.index],
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    width: AppSize.width(context) * .5,
                  ),
                  widget.isClose
                      ? IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            Assets.assetsImagesClose,
                            width: 14,
                          ))
                      : Container()
                ],
              ),
              const SizedBox(height: 3),
              Text(
                "The shop is preparing your order.",
                style: Styles.textStyle12.copyWith(color: AllColors.kDataColor),
              ),
              const SizedBox(height: 3),
              Text(
                "10:00AM - July 05, 2023",
                style: Styles.textStyle12.copyWith(color: AllColors.kDataColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
