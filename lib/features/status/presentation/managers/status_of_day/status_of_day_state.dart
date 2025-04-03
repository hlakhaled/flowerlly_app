part of 'status_of_day_cubit.dart';

@immutable
sealed class StatusOfDayState {}

final class StatusOfDayInitial extends StatusOfDayState {}

final class StatusOfDayFailure extends StatusOfDayState {
  final String errorMsg;
  StatusOfDayFailure({required this.errorMsg});
}

final class StatusOfDayLoading extends StatusOfDayState {}

final class StatusOfDaySuccess extends StatusOfDayState {

  StatusOfDaySuccess();
}
