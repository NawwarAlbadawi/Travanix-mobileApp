import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travanix/Features/profile/data/models/ProfileModel.dart';
import 'package:travanix/Features/profile/data/repositories/charge_wallet_repo.dart';
import 'package:travanix/Features/profile/data/repositories/get_profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context)=>BlocProvider.of(context);


  void getProfileData()
  {
    emit(GetProfileDataLoading());
    ProfileRepo profileRepo=ProfileRepo();
    profileRepo.getProfile().fold(
        (error){
          emit(GetProfileDataFail());
        },
        (model){
          emit(GetProfileDataSuccess(
            profileModel: model
          ));
        }
    );
  }

  void chargeWallet({required String code})
  {
    emit(ChargeWalletLoading());
    ChargeWalletRepo chargeWalletRepo =ChargeWalletRepo();
    chargeWalletRepo.chargeWallet(code: code).fold(
            (error){
          emit(ChargeWalletFail());
        },
            (model){
          emit(ChargeWalletSuccess());
        }
    );
  }

}
