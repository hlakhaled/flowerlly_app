import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/status/domain/entities/status_entity.dart';
import 'package:flowerlly_app/features/status/presentation/managers/delete_status/delete_status_cubit.dart';
import 'package:flowerlly_app/features/status/presentation/managers/status/status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ItemsInList extends StatefulWidget {
  const ItemsInList({
    super.key,
    required this.index,
    required this.items,
    required this.length,
    this.isClose = false,
  });

  final int index;
  final int length;
  final StatusEntity items;
  final bool isClose;

  @override
  State<ItemsInList> createState() => _ItemsInListState();
}

class _ItemsInListState extends State<ItemsInList> {
  late List<bool> isChecked;

  @override
  void initState() {
    isChecked = List.generate(widget.length, (index) => false);
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
            padding: EdgeInsets.only(top: AppSize.height(context) * .02),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.items.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle18,
                      ),
                    ),
                    if (widget.isClose)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: IconButton(
                          onPressed: () {
                            context
                                .read<DeleteStatusCubit>()
                                .deleteStatus(widget.index);
                            context.read<StatusCubit>().fetchStatus();
                          },
                          icon: SvgPicture.asset(
                            Assets.assetsImagesClose,
                            width: 14,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  widget.items.description,
                  style:
                      Styles.textStyle12.copyWith(color: AllColors.kDataColor),
                ),
                const SizedBox(height: 3),
                Text(
                  widget.items.date,
                  style:
                      Styles.textStyle12.copyWith(color: AllColors.kDataColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
