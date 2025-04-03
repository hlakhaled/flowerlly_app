part of 'add_status_cubit.dart';

@immutable
sealed class AddStatusState {}

final class AddStatusInitial extends AddStatusState {}


final class AddStatusFailure extends AddStatusState {
  final String errorMsg;
 AddStatusFailure({required this.errorMsg});
}

final class  AddStatusLoading extends AddStatusState {}

final class  AddStatusSuccess extends AddStatusState {

}
