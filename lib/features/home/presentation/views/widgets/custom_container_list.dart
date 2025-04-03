import 'package:flowerlly_app/constants/assets.dart';

import 'package:flowerlly_app/features/home/data/models/description_of_plant_model.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_details_entity.dart';
import 'package:flowerlly_app/features/home/presentation/views/widgets/custom_container_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomContainerList extends StatelessWidget {
  int i = 0;
  PlantDetailsEntity plant;
  List<DescriptionOfPlantModel> get itemInList => [
        DescriptionOfPlantModel(
            icon: SvgPicture.asset(Assets.assetsImagesCare),
            title: "Care Level",
            description: plant.careLevelEntity),
        DescriptionOfPlantModel(
            icon: SvgPicture.asset(Assets.assetsImagesGrow),
            title: "Growth Rate",
            description: plant.growthRateEntity),
        DescriptionOfPlantModel(
            icon: SvgPicture.asset(Assets.assetsImagesPruning),
            title: "Pruning Month",
            description: getList(plant.pruningMonthEntity)),
        DescriptionOfPlantModel(
            icon: SvgPicture.asset(Assets.assetsImagesType),
            title: "Type",
            description: plant.typeEntity),
        DescriptionOfPlantModel(
            icon: SvgPicture.asset(Assets.assetsImagesWater),
            title: "propagation",
            description: getList(plant.propagationEntity)),
        DescriptionOfPlantModel(
            icon: SvgPicture.asset(Assets.assetsImagesPlace),
            title: "Origin",
            description: getList(plant.originEntity)),
        DescriptionOfPlantModel(
            icon: SvgPicture.asset(Assets.assetsImagesAttraction),
            title: "Attracts",
            description: getList(plant.attractsEntity)),
        DescriptionOfPlantModel(
            icon: SvgPicture.asset(Assets.assetsImagesFlower3),
            title: "Flowering Season",
            description: plant.floweringSeasonEntity),
      ];
  CustomContainerList({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
      ),
      itemBuilder: (context, index) => CustomContainerItem(
        descriptionOfPlantModel: itemInList[i++],
      ),
    );
  }
}

String getList(List<dynamic> plant) {
  return plant.take(3).join(" , ");
}
