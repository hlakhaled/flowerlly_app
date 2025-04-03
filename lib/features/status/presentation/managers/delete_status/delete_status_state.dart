part of 'delete_status_cubit.dart';

@immutable
sealed class DeleteStatusState {}

final class DeleteStatusInitial extends DeleteStatusState {}

final class DeleteStatusFailure extends DeleteStatusState {
  final String errorMsg;
 DeleteStatusFailure({required this.errorMsg});
}

final class  DeleteStatusLoading extends DeleteStatusState {}

final class  DeleteStatusSuccess extends DeleteStatusState {

}
