import 'package:hive/hive.dart';
part 'plant_details_entity.g.dart';

@HiveType(typeId: 1)
class PlantDetailsEntity {
  @HiveField(0)
  final String descriptionEntity;
  @HiveField(1)
  final String titleEntity;

  @HiveField(2)
  final String careLevelEntity;
  @HiveField(3)
  final String growthRateEntity;
  @HiveField(4)
  final List<dynamic> pruningMonthEntity;
  @HiveField(5)
  final List<dynamic> propagationEntity;
  @HiveField(6)
  final List<dynamic> attractsEntity;
  @HiveField(7)
  final List<dynamic> originEntity;
  @HiveField(8)
  final String floweringSeasonEntity;
  @HiveField(9)
  final String image;
  @HiveField(10)
  final String typeEntity;
    @HiveField(11)
  final int idEntity;
  PlantDetailsEntity(
      {required this.typeEntity,
      required this.idEntity,
      required this.originEntity,
      required this.image,
      required this.descriptionEntity,
      // required this.components,
      required this.careLevelEntity,
      required this.growthRateEntity,
      required this.pruningMonthEntity,
      required this.propagationEntity,
      required this.attractsEntity,
      required this.floweringSeasonEntity,
      required this.titleEntity});
}
