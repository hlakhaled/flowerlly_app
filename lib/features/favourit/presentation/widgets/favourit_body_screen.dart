import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/constants/constant.dart';

import 'package:flowerlly_app/features/favourit/presentation/widgets/custom_app_bar.dart';
import 'package:flowerlly_app/features/favourit/presentation/widgets/horizontal_item_in_list.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavouritBodyScreen extends StatelessWidget {
  const FavouritBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<PlantEntity> items = getItems();
    return CustomScrollView(
      physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: AppSize.height(context) * .06,
          ),
        ),
        const SliverToBoxAdapter(
            child: CustomAppBar(
          text: "Favoutits",
        )),
        SliverToBoxAdapter(
          child: SizedBox(
            height: AppSize.height(context) * .04,
          ),
        ),
        SliverToBoxAdapter(
            child: ListView.builder(
          physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              HorizontalItemInList(item: items[index]),
          itemCount: items.length,
        )),
      ],
    );
  }

  List<PlantEntity> getItems() {
    var plantBox = Hive.box<PlantEntity>(kFavouritPlantBox);
    var items = plantBox.values.toList();
    return items;
  }
}
