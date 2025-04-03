import 'package:bloc/bloc.dart';
import 'package:flowerlly_app/features/status/domain/entities/status_entity.dart';
import 'package:flowerlly_app/features/status/domain/use_cases/fetch_status_use_case.dart';
import 'package:meta/meta.dart';

part 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit({required this.fetchStatusUseCase}) : super(StatusInitial());

  FetchStatusUseCase fetchStatusUseCase;
  Future<void> fetchStatus() async {
    emit(StatusLoading());

    final result = await fetchStatusUseCase.call();

    result.fold(
      (failure) => emit(StatusFailure(errorMsg: failure.toString())),
      (plant) {
        emit(StatusSuccess(plant: plant));
      },
    );
  }
}
