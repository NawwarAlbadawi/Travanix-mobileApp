



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:travanix/Features/authentication/presentation/views/widgets/login_button.dart';
import 'package:travanix/Features/authentication/presentation/views/widgets/password_form_field.dart';
import 'package:travanix/Features/authentication/presentation/views/widgets/second_way_of_login.dart';


import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';

import 'package:travanix/core/widgets/custom_text_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/generated/assets.dart';


class  LoginScreenBody extends StatelessWidget {
     LoginScreenBody({super.key});

  static var  emailController=TextEditingController();
   GlobalKey<FormState> formKey=GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*.05),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image:DecorationImage(
                              image:AssetImage(
                                  Assets.imagesLogin
                              )
                          )
                      ),
                    ),
                  ),
                 const SizedBox(height: 20,),
                  Text('Welcome to Travanix',style:
                    AppTextStyles.styleSemiBold24(context), ),
                  const SizedBox(height: 5,),
                  Text('Log in to continue',style:AppTextStyles.styleSemiBold16(context) ,),

                  const   SizedBox(height: 20,),
                  CustomTextFormField(
                    prefix:const Icon(Icons.alternate_email_outlined,),
                    controller:emailController ,
                    hintText: 'Email Address',
                    textInputType: TextInputType.emailAddress,
                    onChange: (value){

                    },

                    validator: (string)
                    {
                      if(string!.isEmpty)
                      {
                        return 'Email is a required field';
                      }
                      return null;
                    },

                  ),
                  const  SizedBox(height: 20,),
                  const PasswordFormField(),
                  const   SizedBox(height: 20,),
                    CustomTextButton(
                    text: 'Forgot Password ',
                    onPressed: (){
                      GoRouter.of(context).push(AppRouter.restPasswordUsingEmail);
                    },

                  ),
                   LoginButton(formKey: formKey,),
                  const  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Don''\'t have an Account ? ',
                        style: AppTextStyles.styleRegular16(context),),
                       CustomTextButton(
                        onPressed: (){

                          GoRouter.of(context).push(AppRouter.registerScreen);
                        },
                        text: 'Register Now',
                        textColor: basicColor,)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 3.0),
                          child: Container(
                            height: 1,

                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text('Or',

                        style: AppTextStyles.styleMedium14(context),),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Container(
                            height: 1,

                            color: Colors.black,
                          ),
                        ),
                      ),



                    ],),
                  const SizedBox(height: 5,),
                ],
              ),
            ) ,
          ),
          const SliverFillRemaining(
            hasScrollBody: false,

            child: SecondWayOfLogin(),
          )
        ],

      ),
    );
  }
}




