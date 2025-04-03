import 'package:bloc/bloc.dart';

import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';
import 'package:flowerlly_app/features/home/domain/use_cases/fetch_plant_use_case.dart';

part 'plant_state.dart';

class PlantCubit extends Cubit<PlantState> {
  PlantCubit(this.fetchPlantUseCase) : super(PlantInitial());
  FetchPlantUseCase fetchPlantUseCase;
  Future<void> fetchPlant(String q) async {
    if (state is PlantLoading) return;
    emit(PlantLoading());

    final result = await fetchPlantUseCase.call(q);

    result.fold(
      (failure) => emit(PlantFailure(errorMsg: failure.toString())),
      (plant) {
        emit(PlantSuccess(plant: plant));
      },
    );
  }
}
