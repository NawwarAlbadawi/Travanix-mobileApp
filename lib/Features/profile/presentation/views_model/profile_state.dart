part of 'profile_cubit.dart';


sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileDataLoading extends ProfileState {}
final class GetProfileDataSuccess extends ProfileState {

   final ProfileModel profileModel;

  GetProfileDataSuccess({required this.profileModel});

}
final class GetProfileDataFail extends ProfileState {}

final class ChargeWalletLoading extends ProfileState{}

final class ChargeWalletSuccess extends ProfileState{}


final class ChargeWalletFail extends ProfileState{}