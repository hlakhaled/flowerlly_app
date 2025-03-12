import 'package:hive/hive.dart';
  part 'plant_entity.g.dart';
@HiveType(typeId: 0)
class PlantEntity {
@HiveField(0)
  final String image;
@HiveField(1)
  final String title;
  @HiveField(2)
  final int pId;
  PlantEntity({required this.image, required this.title,required this.pId});
}
