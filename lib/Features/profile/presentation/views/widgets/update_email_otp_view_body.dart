import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/profile/presentation/views_model/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:travanix/Features/profile/presentation/views_model/profile_cubit.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/custom_toast.dart';

import '../../../../../core/widgets/custom_material_button.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../authentication/presentation/views/widgets/otp_ui.dart';
class UpdateEmailOtpViewBody extends StatelessWidget {
  const UpdateEmailOtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController>controllers=[
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    return BlocConsumer<EditProfileCubit,EditProfileState>(

      listener: (context,state){
        if(state is EditProfileSuccess)
          {
            ProfileCubit.get(context).getProfileData();
            const CustomToast().build(context: context, text: 'Your Profile Updates', color: Colors.green);
            GoRouter.of(context).go(AppRouter.travanixLayoutView);
          }
      },
      builder:(context,state){
        var cubit=EditProfileCubit.get(context);
        return Padding(
        padding:const  EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              OtpUi(email: cubit.emailController.text, controllers: controllers),
              const SizedBox(height: 40,),
              SizedBox(
                width: double.infinity,
                height: 45,

                child: CustomMaterialButton(
                  onPressed: (){
                    String otp='';
                    for(int i=0;i<controllers.length;i++  )
                    {
                      otp+=controllers[i].text;
                    }

                    cubit.verifyOTP(otp: otp);

                  },
                  text: 'Continue',
                  radius: 15,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextButton(text: 'Resend OTP', onPressed: (){
                cubit.sendOtp();

              })
            ],
          ),
        ),
      );
      }
    );
  }
}
