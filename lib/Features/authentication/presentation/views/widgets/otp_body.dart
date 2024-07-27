import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/authentication/presentation/views_models/cubit/otp/otp_cubit.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_button.dart';
import 'package:travanix/core/widgets/custom_toast.dart';
import 'otp_ui.dart';

class OTPBody extends StatefulWidget {
  const OTPBody({super.key, required this.email, required this.fromWhere, this.name, this.password});
  final  String email;
  final String fromWhere;
  final String ?password;
  final String ?name;

  @override
  State<OTPBody> createState() {
    return   _OTPBodyState(email: email,fromWhere:  fromWhere,
  password:password,
   name:name);
  }
}

class _OTPBodyState extends State<OTPBody> {
  final String email;
  final String fromWhere;
  final String ?password;
  final String ?name;
  final List<TextEditingController>controllers=[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  

   _OTPBodyState({required this.fromWhere, this.password, this.name,required this.email});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {

    return  BlocProvider(
      create: (context)=>OtpCubit()..sendOtp(email: email),
      child: BlocConsumer<OtpCubit,OtpState>(
        listener: (context,state){
          if(state is VerifyOTPSuccess)
            {
              if(fromWhere =='fromSignUp')
                {

              context.goNamed('RegisterLoading',pathParameters: {
                'email':email,
                'name':name!,
                'password':password!
              });}
              else
                {

                  context.pushReplacement(AppRouter.restPasswordView);
                }

            }
          else if(state is VerifyOTPError)
            {
             const  CustomToast().build(context: context, text: 'Invalid code', color: Colors.red);
            }
        },
        builder: (context,state){
          return Padding(
            padding:const  EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OtpUi(email: email, controllers: controllers),
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

                        OtpCubit.get(context).verifyOTP(otp: otp);

                      },
                      text: 'Continue',
                      radius: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextButton(text: 'Resend OTP', onPressed: (){
                    OtpCubit.get(context).sendOtp(email: email);

                  })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


