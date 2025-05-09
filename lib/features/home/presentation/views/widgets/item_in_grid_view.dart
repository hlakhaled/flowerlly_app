import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/constants/constant.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';
import 'package:flowerlly_app/features/home/presentation/managers/plant_details_cubit/plant_details_cubit.dart';
import 'package:flowerlly_app/features/home/presentation/managers/plant_id_cubit.dart';
import 'package:flowerlly_app/features/home/presentation/views/item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ItemInGridView extends StatefulWidget {
  final PlantEntity plantEntity;
  const ItemInGridView({super.key, required this.plantEntity});

  @override
  State<ItemInGridView> createState() => _ItemInGridViewState();
}

class _ItemInGridViewState extends State<ItemInGridView> {
  late bool isPressed;
  @override
  void initState() {
    isPressed = widget.plantEntity.isFavourit;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PlantIdCubit>().changeId(widget.plantEntity.pId);
        context
            .read<PlantDetailsCubit>()
            .fetchPlantDetails(widget.plantEntity.pId.toString());

        Navigator.pushNamed(context, ItemDetails.id);
      },
      child: Column(
        children: [
          Stack(children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.plantEntity.image,
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
              right: 25,
              top: 9,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.83),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        isPressed == true
                            ? isPressed = false
                            : isPressed = true;
                      });

                      var box = Hive.box<PlantEntity>(kFavouritPlantBox);
                      if (isPressed == true) {
                        widget.plantEntity.isFavourit = true;
                        updateIsFavourite(widget.plantEntity.pId - 1, true);

                        box.put(widget.plantEntity.pId - 1, widget.plantEntity);
                      } else {
                        widget.plantEntity.isFavourit = false;
                        updateIsFavourite(widget.plantEntity.pId - 1, false);
                        box.delete(widget.plantEntity.pId - 1);
                      }
                    },
                    icon: isFaverouit()),
              ),
            ),
          ]),
          SizedBox(
            height: AppSize.height(context) * .01,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                widget.plantEntity.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle12.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
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

void updateIsFavourite(int plantId, bool newValue) {
  var plantBox = Hive.box<PlantEntity>(kPlantBox);

  if (plantBox.containsKey(plantId)) {
    var plant = plantBox.get(plantId);
    if (plant != null) {
      plant.isFavourit = newValue;
      plantBox.put(plantId, plant);
    }
  }
}
