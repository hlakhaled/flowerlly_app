import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';

import 'package:flowerlly_app/core/utils/styles.dart';

import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';
import 'package:flowerlly_app/features/home/presentation/managers/plant_details_cubit/plant_details_cubit.dart';

import 'package:flowerlly_app/features/home/presentation/views/item_details.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HorizontalItemInList extends StatelessWidget {
  const HorizontalItemInList({super.key, required this.item});
  final PlantEntity item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context
                .read<PlantDetailsCubit>()
                .fetchPlantDetails(item.pId.toString());
            Navigator.pushNamed(context, ItemDetails.id);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: AppSize.width(context) * .03,
              ),
              Stack(children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      item.image,
                      fit: BoxFit.cover,
                      width: 130,
                      height: 130,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.image_not_supported_outlined,
                        size: 130,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 9,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.83),
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: AllColors.kGreenColor,
                        )),
                  ),
                ),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.height(context) * .03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle12
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle12Inter),
                  ),
                ],
              ),
            ],
          ),
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
