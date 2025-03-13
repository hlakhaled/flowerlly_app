part of 'plant_category_cubit.dart';

@immutable
sealed class PlantCategoryState {}

final class PlantCategoryInitial extends PlantCategoryState {}

final class PlantCategoryFailure extends PlantCategoryState {
  final String errorMsg;
  PlantCategoryFailure({required this.errorMsg});
}

final class PlantCategoryLoading extends PlantCategoryState {}

final class PlantCategorySuccess extends PlantCategoryState {
  final List<PlantEntity> plant;
  PlantCategorySuccess({required this.plant});
}
