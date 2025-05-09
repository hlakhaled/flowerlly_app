import 'package:flowerlly_app/features/home/presentation/managers/plant_cubit/plant_cubit.dart';
import 'package:flowerlly_app/features/home/presentation/views/widgets/item_in_grid_view.dart';
import 'package:flowerlly_app/features/home/presentation/views/widgets/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlantCubit, PlantState>(
      builder: (context, state) {
        if (state is PlantFailure) {
          return Center(child: Text(state.errorMsg));
        } else if (state is PlantSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.plant.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 28,
                crossAxisSpacing: 14,
              ),
              itemBuilder: (context, index) => ItemInGridView(
                plantEntity: state.plant[index],
              ),
            ),
          );
        } else {
   
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 28,
                crossAxisSpacing: 14,
              ),
              itemBuilder: (context, index) => const ShimmerGridItem(),
            ),
          );
        }
      },
    );
  }
}
