import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travanix/Features/authentication/data/cubit/change_password_visibility/change_password_secure_cubit.dart';

import 'package:travanix/core/widgets/custom_text_form_field.dart';
class PasswordFormField extends StatelessWidget {
   PasswordFormField({super.key});
  static var   passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create:(context)=> ChangePasswordSecureCubit(),
      child: BlocBuilder<ChangePasswordSecureCubit,ChangePasswordSecureState>(
          builder:(context,state){
            return CustomTextFormField(
              prefix:const Icon(Icons.lock_outline_rounded,),
              controller:passwordController ,
              hintText: 'Password',
              isPassword: ChangePasswordSecureCubit.get(context).isVisible,
              suffix: IconButton(
                icon: Icon(
                ChangePasswordSecureCubit.get(context).passwordIcon,
                ),
                onPressed: (){
                  ChangePasswordSecureCubit.get(context).changePasswordVisibility();
                },
              ),
              textInputType: TextInputType.visiblePassword,
              validator: (string)
              {
                if(string!.isEmpty)
                {
                  return 'Password must Not be Empty';
                }

              },

            );
          } ),
    );
  }
}
