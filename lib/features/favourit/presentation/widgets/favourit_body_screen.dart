import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/constants/constant.dart';

import 'package:flowerlly_app/features/favourit/presentation/widgets/custom_app_bar.dart';
import 'package:flowerlly_app/features/favourit/presentation/widgets/horizontal_item_in_list.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavouritBodyScreen extends StatelessWidget {
  const FavouritBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: ValueListenableBuilder(
                valueListenable:
                    Hive.box<PlantEntity>(kFavouritPlantBox).listenable(),
                builder: (context, Box<PlantEntity> box, _) {
                  final plants = box.values.toList();

                  return ListView.builder(
                    physics: const ScrollPhysics(
                        parent: NeverScrollableScrollPhysics()),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        HorizontalItemInList(item: plants[index], index: index),
                    itemCount: plants.length,
                  );
                }))
      ],
    );
  }
}
