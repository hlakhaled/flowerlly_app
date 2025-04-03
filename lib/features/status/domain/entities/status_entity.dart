import 'package:hive/hive.dart';
part 'status_entity.g.dart';

@HiveType(typeId: 2)
class StatusEntity {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String date;

  StatusEntity(
      {required this.title, required this.description, required this.date});
}
