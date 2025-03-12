import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';

abstract class HomeLocalDataSource {
    List<PlantEntity> fetchPlants();
    List<PlantEntity> fetchaCategoryOfPlants();
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource
{
  @override
  List<PlantEntity> fetchPlants() {
    // TODO: implement fetchPlants
    throw UnimplementedError();
  }

  @override
  List<PlantEntity> fetchaCategoryOfPlants() {
    // TODO: implement fetchaCategoryOfPlants
    throw UnimplementedError();
  }


}