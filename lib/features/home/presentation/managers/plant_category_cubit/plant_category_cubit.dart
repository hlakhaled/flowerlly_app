import 'package:bloc/bloc.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';
import 'package:flowerlly_app/features/home/domain/use_cases/fetch_category_of_plants_use_case.dart';

import 'package:meta/meta.dart';

part 'plant_category_state.dart';

class PlantCategoryCubit extends Cubit<PlantCategoryState> {
  PlantCategoryCubit(this.fetchCategoryOfPlantsUseCase)
      : super(PlantCategoryInitial());
  FetchCategoryOfPlantsUseCase fetchCategoryOfPlantsUseCase;

  Future<void> fetchCategoryOfPlants() async {
    emit(PlantCategoryLoading());
    var result = await fetchCategoryOfPlantsUseCase.call();
    result.fold((f) {
      emit(PlantCategoryFailure(errorMsg: f.toString()));
    }, (s) {
      emit(PlantCategorySuccess(plant: s));
    });
  }
}
