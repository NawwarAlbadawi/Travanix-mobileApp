part of 'change_password_secure_cubit.dart';

@immutable
sealed class ChangePasswordSecureState {}

final class ChangePasswordSecureInitial extends ChangePasswordSecureState {}
final class ChangePasswordVisibility extends ChangePasswordSecureState {}

