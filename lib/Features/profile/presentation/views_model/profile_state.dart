part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileDataLoading extends ProfileState {}
final class GetProfileDataSuccess extends ProfileState {

   final ProfileModel profileModel;

  GetProfileDataSuccess({required this.profileModel});

}
final class GetProfileDataFail extends ProfileState {}
