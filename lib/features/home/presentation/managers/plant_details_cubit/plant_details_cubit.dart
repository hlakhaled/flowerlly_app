import 'package:bloc/bloc.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_details_entity.dart';
import 'package:flowerlly_app/features/home/domain/use_cases/fetch_plant_details_use_case.dart';
import 'package:meta/meta.dart';

part 'plant_details_state.dart';

class PlantDetailsCubit extends Cubit<PlantDetailsState> {
  PlantDetailsCubit(this.fetchPlantDetailsUseCase) : super(PlantDetailsInitial());
  FetchPlantDetailsUseCase fetchPlantDetailsUseCase;
  Future<void> fetchPlantDetails(String id) async {
    if (state is PlantDetailsLoading) return;
    emit(PlantDetailsLoading());

    final result = await fetchPlantDetailsUseCase.call(id);

    result.fold(
      (failure) => emit(PlantDetailsFailure(errorMsg: failure.toString())),
      (plant) {
        emit(PlantDetailsSuccess(plant: plant));
      },
    );
  }



}
