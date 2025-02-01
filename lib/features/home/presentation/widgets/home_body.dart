import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/home/presentation/widgets/custom_grid_view.dart';
import 'package:flowerlly_app/features/home/presentation/widgets/custom_search_text_field.dart';
import 'package:flowerlly_app/features/home/presentation/widgets/horizonatal_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  final List<String> items = const [
    "for Wedding",
    "Flowers in box",
    "for Birthday",
    "Roses"
  ];
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
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                "Flowerly",
                style: Styles.textStyle36,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(height: AppSize.height(context) * .04)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 19, right: 12),
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: CustomSearchTextField(),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: SvgPicture.asset(Assets.assetsImagesFilter),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(height: AppSize.height(context) * .04)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Text(
                "Categories",
                style: Styles.textStyle20,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: HorizonatalListView(items: items),
          ),
          SliverToBoxAdapter(
              child: SizedBox(height: AppSize.height(context) * .01)),
          const SliverToBoxAdapter(
            child: CustomGridView(),
          ),
          SliverToBoxAdapter(
              child: SizedBox(height: AppSize.height(context) * .04)),
        ]);
  }
}
