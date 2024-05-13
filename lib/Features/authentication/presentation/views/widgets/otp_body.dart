import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/authentication/presentation/views/widgets/otp_item.dart';
import 'package:travanix/Features/authentication/presentation/views_models/cubit/otp/otp_cubit.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_button.dart';
import 'package:travanix/generated/assets.dart';
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
                  print(password);
              GoRouter.of(context).pushNamed('RegisterLoading',pathParameters: {
                'email':email,
                'name':name!,
                'password':password!
              });}
              else
                {

                  GoRouter.of(context).pushReplacement(AppRouter.restPasswordView);
                }

            }
        },
        builder: (context,state){
          return Padding(
            padding:const  EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AspectRatio(aspectRatio:1.3 ,
                    child: Container(
                      decoration:const BoxDecoration(
                          image: DecorationImage(
                              image:AssetImage(
                                  Assets.imagesOTP
                              )
                          )
                      ),
                    ),),
                  Text('Verify your email',
                    style: AppTextStyles.styleSemiBold24(context).copyWith(
                        fontSize: 30
                    ),),
                  const SizedBox(height: 5),
                  Text('We just sent the code to  ' ,
                    style: AppTextStyles.styleSemiBold18(context),),
                  const SizedBox(height: 5),
                  Text(email ,
                    style: AppTextStyles.styleMedium16(context).copyWith(
                        color: basicColor
                    ),),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) => OTPItem(
                      controller:controllers[index] ,
                      index: index,
                    ) ),
                  ),
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
