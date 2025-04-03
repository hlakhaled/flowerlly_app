import 'package:flowerlly_app/features/status/domain/entities/status_entity.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class StatusListEntity {
  @HiveField(0)
  List<StatusEntity> status;

  StatusListEntity({required this.status});
}
