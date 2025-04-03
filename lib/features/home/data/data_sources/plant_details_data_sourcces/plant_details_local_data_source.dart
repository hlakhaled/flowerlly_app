import 'package:flowerlly_app/constants/constant.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_details_entity.dart';
import 'package:hive/hive.dart';

abstract class PlantDetailsLocalDataSource {
PlantDetailsEntity? fetchPlantDetails(String id);
}

class PlantDetailsLocalDataSourceimpl extends PlantDetailsLocalDataSource {
  @override
PlantDetailsEntity? fetchPlantDetails(String id) {
  var box = Hive.box<PlantDetailsEntity>(kPlantDetailsBox);
  if (!box.containsKey(id)) {
    return null;
  }
  return box.get(id);
}

}
