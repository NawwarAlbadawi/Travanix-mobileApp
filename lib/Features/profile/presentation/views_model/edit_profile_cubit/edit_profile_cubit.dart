import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/profile/data/repositories/edit_profile_repo.dart';
import 'package:travanix/Features/profile/presentation/views_model/profile_cubit.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._editProfileRepo) : super(EditProfileInitial());

  static EditProfileCubit get(context)=>BlocProvider.of(context);
  final TextEditingController emailController=TextEditingController();
  final TextEditingController nameController=TextEditingController();

  final EditProfileRepo _editProfileRepo;
  Future<void> editProfile() async
  {
    emit(EditProfileLoading());

    await _editProfileRepo.editProfile(name: nameController.text,email: emailController.text).fold(
            (error){
          emit(EditProfileFail());
        },
            (model){
          emit(EditProfileSuccess());

        }
    );
  }


  EmailOTP myAuth = EmailOTP();

  Future<void> sendOtp() async {
    EmailOTP.config(
        appEmail: "nowar200342@gmail.com",
        appName: "Travanix",
        otpLength: 5,
        otpType: OTPType.numeric,
        emailTheme: EmailTheme.v1
    );


    if( await  EmailOTP.sendOTP(email: emailController.text)==true)
    {

      emit(SendOTPSuccess());
    }
  }
  Future<void> verifyOTP({required String otp})async
  {
    if( EmailOTP.verifyOTP (otp: otp))
    {

      emit(VerifyOTPSuccess());
      editProfile();
    }
    else
    {
      emit(VerifyOTPError());
    }
  }
}
