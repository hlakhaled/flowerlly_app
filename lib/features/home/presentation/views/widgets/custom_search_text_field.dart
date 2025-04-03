import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/constants/constant.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';
import 'package:flowerlly_app/features/home/presentation/managers/plant_cubit/plant_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  // final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) async {
        var box = await Hive.box<PlantEntity>(kPlantBox);
        box.clear();
        context.read<PlantCubit>().fetchPlant(value);
      },
      cursorColor: AllColors.kGreenColor,
      // controller: controller,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.asset(
            Assets.assetsImagesSearch,
          ),
        ),
        hintText: "Search",
        hintStyle: Styles.textStyle16Inter,
        enabledBorder: outlineInputBorder(),
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(true),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder([bool isFocus = false]) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: isFocus ? AllColors.kGreenColor : AllColors.kLightGreenColor,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
