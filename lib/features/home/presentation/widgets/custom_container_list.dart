import 'package:flowerlly_app/constants/assets.dart';

import 'package:flowerlly_app/features/home/data/models/description_of_plant_model.dart';
import 'package:flowerlly_app/features/home/presentation/widgets/custom_container_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomContainerList extends StatelessWidget {
  int i = 0;
  final List<DescriptionOfPlantModel> itemInList = [
    DescriptionOfPlantModel(
        icon: SvgPicture.asset(Assets.assetsImagesCare),
        title: "Care Level",
        description: "Medium"),
    DescriptionOfPlantModel(
        icon: SvgPicture.asset(Assets.assetsImagesPeriod),
        title: "Watering Period",
        description: "Morning , Evening"),
    DescriptionOfPlantModel(
        icon: SvgPicture.asset(Assets.assetsImagesWatering),
        title: "Watering",
        description: "10 - 20°C"),
    DescriptionOfPlantModel(
        icon: SvgPicture.asset(Assets.assetsImagesGrow),
        title: "Growth Rate",
        description: "High"),
    DescriptionOfPlantModel(
        icon: SvgPicture.asset(Assets.assetsImagesPruning),
        title: "Pruning Month",
        description: "March , April"),
    DescriptionOfPlantModel(
        icon: SvgPicture.asset(Assets.assetsImagesSunny),
        title: "Sunlight Duration",
        description: "10 - 20 H"),
    DescriptionOfPlantModel(
        icon: SvgPicture.asset(Assets.assetsImagesWater),
        title: "propagation",
        description: "seed , cutting"),
    DescriptionOfPlantModel(
        icon: SvgPicture.asset(Assets.assetsImagesAttraction),
        title: "Attracts",
        description: "bees, birds, rabbits"),
    DescriptionOfPlantModel(
        icon: SvgPicture.asset(Assets.assetsImagesHarvest),
        title: "Harvest Method",
        description: "cutting"),
    DescriptionOfPlantModel(
        icon: SvgPicture.asset(Assets.assetsImagesFlower3),
        title: "Flowering Season",
        description: "Spring"),
  ];
  CustomContainerList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
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
