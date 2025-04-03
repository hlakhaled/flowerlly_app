import 'package:flowerlly_app/features/home/domain/entities/plant_details_entity.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';
import 'package:hive/hive.dart';

void saveData(List<PlantEntity> plant, String boxName) {
  var box = Hive.box<PlantEntity>(boxName);
  box.addAll(plant);
}

void savePlantDetails(PlantDetailsEntity plant, String boxName, int key) {
  var box = Hive.box<PlantDetailsEntity>(boxName);
  box.put(plant.idEntity, plant);

}
