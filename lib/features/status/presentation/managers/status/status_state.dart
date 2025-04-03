part of 'status_cubit.dart';

@immutable
sealed class StatusState {}

final class StatusInitial extends StatusState {}

final class StatusFailure extends StatusState {
  final String errorMsg;
  StatusFailure({required this.errorMsg});
}

final class StatusLoading extends StatusState {}

final class StatusSuccess extends StatusState {
  final List<StatusEntity> plant;
  StatusSuccess({required this.plant});
}
