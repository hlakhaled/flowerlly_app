part of 'plant_details_cubit.dart';

@immutable
sealed class PlantDetailsState {}

final class PlantDetailsInitial extends PlantDetailsState {}

final class PlantDetailsFailure extends PlantDetailsState {
  final String errorMsg;
  PlantDetailsFailure({required this.errorMsg});
}

final class PlantDetailsLoading extends PlantDetailsState {}

final class PlantDetailsSuccess extends PlantDetailsState {
  final PlantDetailsEntity plant;
  PlantDetailsSuccess({required this.plant});
}
