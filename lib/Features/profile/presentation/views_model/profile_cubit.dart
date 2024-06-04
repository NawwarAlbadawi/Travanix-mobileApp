import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/profile/data/models/ProfileModel.dart';
import 'package:travanix/Features/profile/data/repositories/get_profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());


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

}
