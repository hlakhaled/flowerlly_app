import 'package:bloc/bloc.dart';
import 'package:flowerlly_app/constants/constant.dart';
import 'package:flowerlly_app/features/status/domain/entities/status_entity.dart';

import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'add_status_state.dart';

class AddStatusCubit extends Cubit<AddStatusState> {
  AddStatusCubit() : super(AddStatusInitial());
  void addStaus(StatusEntity status) {
    emit(AddStatusLoading());
        try {
      Box<StatusEntity> statusBox = Hive.box<StatusEntity>(kStatusBox);

      statusBox.add(status);

      emit(AddStatusSuccess());
    } catch (e) {
      emit(AddStatusFailure(errorMsg: e.toString()));
    }
  }
}
