import 'package:flowerlly_app/constants/constant.dart';
import 'package:flowerlly_app/core/utils/api_service.dart';
import 'package:flowerlly_app/core/utils/functions/save_data.dart';
import 'package:flowerlly_app/features/home/data/models/plant_model/plant_model.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<PlantEntity>> fetchPlants({required String q});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;
  HomeRemoteDataSourceImpl(this._apiService);
  @override
  Future<List<PlantEntity>> fetchPlants({required String q}) async {
    var data = await _apiService.get(
        endPoint: "v2/species-list?key=sk-VV6167c9981435c328791&q=$q");
    var plant = getPlantList(data);

    saveData(plant, kPlantBox);
    return plant;
  }

  List<PlantEntity> getPlantList(data) {
    List<PlantEntity> plantList = [];
    for (var plant in data["data"]) {
      plantList.add(PlantModel.fromJson(plant));
    }
    return plantList;
  }
}
