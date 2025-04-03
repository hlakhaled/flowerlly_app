import 'package:flowerlly_app/constants/constant.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<PlantEntity> fetchPlants();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<PlantEntity> fetchPlants() {
    var box = Hive.box<PlantEntity>(kPlantBox);

    return box.values.toList();
  }
}
