part of 'check_email_cubit.dart';

@immutable
sealed class CheckEmailState {}

final class CheckEmailInitial extends CheckEmailState {}
final class CheckEmailSuccess extends CheckEmailState {

 final CheckEmailModel model;

  CheckEmailSuccess({required this.model});
}
final class CheckEmailError extends CheckEmailState {
  final String err;

  CheckEmailError({required this.err});
}
