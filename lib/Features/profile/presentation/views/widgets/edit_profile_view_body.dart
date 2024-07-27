import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/profile/presentation/views_model/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:travanix/Features/profile/presentation/views_model/profile_cubit.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/generated/assets.dart';

import '../../../../../core/widgets/custom_toast.dart';


class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<EditProfileCubit,EditProfileState>(
      listener: (context,state){
        if(state is EditProfileSuccess)
          {
            const CustomToast().build(context: context, text: 'Your Profile Updates', color: Colors.green);
            ProfileCubit.get(context).getProfileData();
          }
      },
      builder: (context,state) {
        var cubit=EditProfileCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                Image.asset(Assets.imagesEditprofile),
              const SizedBox( height: 40,),

              CustomTextFormField(controller:cubit.nameController,hintText: 'ChangeYourName',radius: 10,
                  prefix: const  Icon(Icons.drive_file_rename_outline),),
              const SizedBox(height: 20,),
              CustomTextFormField(controller: cubit.emailController,hintText: 'ChangeYourEmail',radius: 10,
                prefix: const  Icon(Icons.email),),
              const SizedBox(height: 40,),
              CustomMaterialButton(
                  onPressed: (){
                    cubit.emailController.text.isEmpty?cubit.editProfile():{GoRouter.of(context).push(AppRouter.updateEmailOtpView),cubit.sendOtp()};
                  },
                  text: 'Save',
              radius: 10,
                width: MediaQuery.sizeOf(context).width*0.6,
                height: 40,
              )

              ],
            ),
          ),
        );
      }
    );
  }
}
