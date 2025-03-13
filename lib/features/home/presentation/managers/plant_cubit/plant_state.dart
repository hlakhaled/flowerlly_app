part of 'plant_cubit.dart';


sealed class PlantState {}

final class PlantInitial extends PlantState {}

final class PlantFailure extends PlantState {
  final String errorMsg;
  PlantFailure({required this.errorMsg});
}

final class PlantLoading extends PlantState {}

final class PlantSuccess extends PlantState {
  final List<PlantEntity> plant;
  PlantSuccess({required this.plant});
}
