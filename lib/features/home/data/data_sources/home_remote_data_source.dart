import 'package:flowerlly_app/constants/constant.dart';
import 'package:flowerlly_app/core/utils/api_service.dart';
import 'package:flowerlly_app/core/utils/functions/save_data.dart';
import 'package:flowerlly_app/features/home/data/models/plant_model/plant_model.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<PlantEntity>> fetchPlants();
  Future<List<PlantEntity>> fetchaCategoryOfPlants();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;
  HomeRemoteDataSourceImpl(this._apiService);
  @override
  Future<List<PlantEntity>> fetchPlants() async {
    var data = await _apiService.get(endPoint: "");
    var plant = getPlantList(data);
    saveData(plant, kPlantBox);
    return plant;
  }

  @override
  Future<List<PlantEntity>> fetchaCategoryOfPlants() async {
    var data = await _apiService.get(endPoint: "");
    var plant = getPlantList(data);
    saveData(plant, kCategoryPlantBox);
    return plant;
  }
}

List<PlantEntity> getPlantList(data) {
  List<PlantEntity> plantList = [];
  for (var plant in data["data"]) {
    plantList.add(PlantModel.fromJson(plant["data"]));
  }
  return plantList;
}
