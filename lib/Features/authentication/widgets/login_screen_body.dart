import 'package:flutter/material.dart';

import 'package:travanix/Features/authentication/widgets/password_form_field.dart';
import 'package:travanix/Features/authentication/widgets/second_way_of_login.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/generated/assets.dart';
class LoginScreenBody extends StatelessWidget {
   LoginScreenBody({super.key});
  var  emailController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child:Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20
            ),
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
                Text('Let''\'s Get Started',style:
                  AppTextStyles.styleSemiBold24(context), ),
                const   SizedBox(height: 20,),
                CustomTextFormField(
                  prefix:const Icon(Icons.alternate_email_outlined,),
                  controller:emailController ,
                  hintText: 'Email Address',
                  validator: (string)
                  {
                    if(string!.isEmpty)
                    {
                      return 'Email must Not be Empty';
                    }
                    return 'dsfr';
                  },

                ),
                const  SizedBox(height: 20,),
                PasswordFormField(),
                const   SizedBox(height: 20,),
                const  CustomTextButton(
                  text: 'Forget Password ?',

                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: CustomMaterialButton(
                    onPressed: (){

                    },
                    text: 'Login',
                    radius: 20,),
                ),
                const  SizedBox(height: 20,),
                Row(
                  children: [
                    Text('Don''\'t have an Account ? ',
                      style: AppTextStyles.styleRegular16(context),),
                    const CustomTextButton(text: 'Register Now',
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

    );
  }
}




