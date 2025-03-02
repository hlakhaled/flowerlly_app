import 'package:flowerlly_app/features/status/presentation/widgets/items_in_list.dart';
import 'package:flutter/material.dart';

class ListOfCheckBox extends StatelessWidget {
  const ListOfCheckBox({super.key,this.isClose=false});
  final bool isClose;
  final List<String> items = const [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 31),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) => ItemsInList(
                index: index,
                items: items,
                isClose: isClose,
              )),
    );
  }
}
