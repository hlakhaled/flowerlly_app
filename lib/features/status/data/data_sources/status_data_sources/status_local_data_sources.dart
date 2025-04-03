import 'package:flowerlly_app/constants/constant.dart';
import 'package:flowerlly_app/features/status/domain/entities/status_entity.dart';
import 'package:flowerlly_app/features/status/domain/entities/status_list_entity/status_list_entity.dart';
import 'package:hive/hive.dart';

abstract class StatusLocalDataSources {
  List<StatusEntity> fetchStatus();
    List<StatusListEntity> fetchStatusList();
}

class StatusLocalDataSourcesImpl extends StatusLocalDataSources {
  @override
  List<StatusEntity> fetchStatus() {
    var statusBox = Hive.box<StatusEntity>(kStatusBox);
    return statusBox.values.toList();
  }
  
  @override
  List<StatusListEntity> fetchStatusList() {
  var statusBox = Hive.box<StatusListEntity>(kStatusDayBox);
    return statusBox.values.toList();
  }
}
