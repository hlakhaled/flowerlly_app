
import 'package:flowerlly_app/features/home/presentation/widgets/category_items.dart';
import 'package:flutter/material.dart';

class HorizonatalListView extends StatelessWidget {
  const HorizonatalListView({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Padding(
        padding: const EdgeInsets.only(left: 13),
        child: ListView.builder(
          physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
          itemBuilder: (context, index) => CategoryItems(
            text: items[index],
          ),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
