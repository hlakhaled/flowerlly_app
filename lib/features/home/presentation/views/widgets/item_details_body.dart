import 'package:flowerlly_app/constants/constant.dart';
import 'package:flowerlly_app/features/favourit/presentation/widgets/custom_app_bar.dart';
import 'package:flowerlly_app/features/favourit/presentation/widgets/horizontal_item_in_list.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_details_entity.dart';
import 'package:flowerlly_app/features/home/presentation/managers/plant_id_cubit.dart';
import 'package:flowerlly_app/features/home/presentation/views/widgets/custom_details_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ItemDetailsBody extends StatelessWidget {
  ItemDetailsBody({super.key});
  final box = Hive.box<PlantDetailsEntity>(kPlantDetailsBox);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            const SizedBox(height: 48), // Space for status bar
            const CustomAppBar(text: "Flowerly", isBack: true),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    box.get(context.read<PlantIdCubit>().getId())?.image ??
                        "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/og/49255769768_df55596553_b.jpg",
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(Icons.broken_image_outlined,
                          size: 80, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const CustomDetatilsBottomSheet(),
          ],
        );
      },
    );
  }
}
