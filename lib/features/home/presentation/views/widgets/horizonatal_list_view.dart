import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/features/home/data/models/plant_categorey.dart';
import 'package:flowerlly_app/features/home/presentation/views/widgets/category_items.dart';
import 'package:flutter/material.dart';

class HorizonatalListView extends StatelessWidget {
  HorizonatalListView({
    super.key,
  });

  final List<PlantCategorey> items = [
    PlantCategorey(title: "Tree", image: Assets.assetsImagesTree),
    PlantCategorey(title: "Rose", image: Assets.assetsImagesRose),
    PlantCategorey(title: "Orchid", image: Assets.assetsImagesOrchid),
    PlantCategorey(title: "Mint", image: Assets.assetsImagesMint),
    PlantCategorey(title: "Cypress", image: Assets.assetsImagesCypress),
    PlantCategorey(title: "Maple", image: Assets.assetsImagesMaple),
    PlantCategorey(title: "Sunflower", image: Assets.assetsImagesSunflower),
    PlantCategorey(title: "Shrub", image: Assets.assetsImagesShrub),
    PlantCategorey(title: "Jasmine", image: Assets.assetsImagesJasmine),
    PlantCategorey(title: "Oak", image: Assets.assetsImagesOak),
    PlantCategorey(title: "Cactus", image: Assets.assetsImagesCactus),
    PlantCategorey(title: "Lily", image: Assets.assetsImagesLily)
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Padding(
        padding: const EdgeInsets.only(left: 13),
        child: ListView.builder(
          physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
          itemBuilder: (context, index) => CategoryItems(
            item: items[index],
          ),
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
