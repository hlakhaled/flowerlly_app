import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/home/presentation/managers/plant_details_cubit/plant_details_cubit.dart';
import 'package:flowerlly_app/features/home/presentation/views/widgets/custom_container_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlantDetails extends StatelessWidget {
  const PlantDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlantDetailsCubit, PlantDetailsState>(
      builder: (context, state) {
        if (state is PlantDetailsFailure) {
          return Text(state.errorMsg);
        } else if (state is PlantDetailsSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.height(context) * .04),
              AutoSizeText(
                state.plant.titleEntity,
                // "Abies alba “European Silver Fir”",
                maxLines: 4,
                style: Styles.textStyle24,
              ),
              SizedBox(height: AppSize.height(context) * .03),
              Text(
                "Description :",
                style: Styles.textStyle16.copyWith(
                    color: AllColors.kBlackColor, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: AppSize.height(context) * .001),
              AutoSizeText(
                state.plant.descriptionEntity,
                maxLines: 4,
                style: Styles.textStyle12.copyWith(
                    color: AllColors.kBlackColor, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: AppSize.height(context) * .001),
              AutoSizeText(
                "Watering European silver fir trees is essential for them to stay",
                maxLines: 4,
                style: Styles.textStyle12.copyWith(
                    color: AllColors.kBlackColor, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: AppSize.height(context) * .04),
              const Divider(
                color: AllColors.kLightGreenColor,
                thickness: 2,
              ),
              SizedBox(height: AppSize.height(context) * .04),
              CustomContainerList(
                plant: state.plant,
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
