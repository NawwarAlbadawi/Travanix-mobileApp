
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'change_password_secure_state.dart';
class ChangePasswordSecureCubit extends Cubit<ChangePasswordSecureState> {
  ChangePasswordSecureCubit() : super(ChangePasswordSecureInitial());

  static  ChangePasswordSecureCubit get (context)=> BlocProvider.of(context);

  IconData passwordIcon=Icons.visibility_off_outlined;
  bool isVisible =true;
  IconData changePasswordVisibility()
  {
    isVisible=!isVisible;
    if(!isVisible)
      {
        passwordIcon=Icons.remove_red_eye_outlined;
      }
    else
      {
        passwordIcon=Icons.visibility_off_outlined;
      }
    emit(ChangePasswordVisibility());
    return passwordIcon;
  }
}
