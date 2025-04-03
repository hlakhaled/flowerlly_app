import 'package:bloc/bloc.dart';
import 'package:flowerlly_app/constants/constant.dart';
import 'package:flowerlly_app/features/status/domain/entities/status_list_entity/status_list_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'status_of_day_state.dart';

class StatusOfDayCubit extends Cubit<StatusOfDayState> {
  StatusOfDayCubit() : super(StatusOfDayInitial());

  void addStatusOfDay(StatusListEntity statusListOfDay) {
    emit(StatusOfDayLoading());

    try {
      var box = Hive.box<StatusListEntity>(kStatusDayBox);
      box.add(statusListOfDay);
      emit(StatusOfDaySuccess());
    } on Exception catch (e) {
      emit(StatusOfDayFailure(errorMsg: e.toString()));
    }
  }
}
