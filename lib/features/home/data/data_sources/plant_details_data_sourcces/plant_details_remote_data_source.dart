import 'package:flowerlly_app/constants/constant.dart';
import 'package:flowerlly_app/core/utils/api_service.dart';
import 'package:flowerlly_app/core/utils/functions/save_data.dart';
import 'package:flowerlly_app/features/home/data/models/plant_details_model/plant_details_model.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_details_entity.dart';

abstract class PlantDetailsRemoteDataSource {
  Future<PlantDetailsEntity> fetchPlantDetails(String id);
}

class PlantDetailsRemoteDataSourceImpl extends PlantDetailsRemoteDataSource {
  ApiService apiService;

  PlantDetailsRemoteDataSourceImpl(
      {required this.apiService});
  @override
  Future<PlantDetailsEntity> fetchPlantDetails(String id) async {
    var data = await apiService.get(
        endPoint: "species/details/$id?key=sk-VV6167c9981435c328791");

    PlantDetailsEntity plantDetails = PlantDetailsModel.fromJson(data);
    savePlantDetails(plantDetails, kPlantDetailsBox, plantDetails.idEntity);

    return plantDetails;
  }
}
