part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoading extends EditProfileState{}

final class EditProfileSuccess extends EditProfileState{}

final class EditProfileFail extends EditProfileState{}

final class SendOTPSuccess extends EditProfileState{

}

final class VerifyOTPSuccess extends EditProfileState{

}
final class VerifyOTPError extends EditProfileState{

}