import 'package:bloc/bloc.dart';
import 'package:flowerlly_app/constants/constant.dart';
import 'package:flowerlly_app/features/status/domain/entities/status_entity.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'delete_status_state.dart';

class DeleteStatusCubit extends Cubit<DeleteStatusState> {
  DeleteStatusCubit() : super(DeleteStatusInitial());
  void deleteStatus(int index) {
    emit(DeleteStatusLoading());
    try {
      var box = Hive.box<StatusEntity>(kStatusBox);
      box.deleteAt(index);
      emit(DeleteStatusSuccess());
    } catch (e) {
      emit(DeleteStatusFailure(errorMsg: e.toString()));
    }
  }
}
