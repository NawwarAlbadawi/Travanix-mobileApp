

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:custom_indicator/custom_indicator.dart';
import 'package:travanix/Features/authentication/widgets/password_form_field.dart';
import 'package:travanix/Features/authentication/widgets/second_way_of_login.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/generated/assets.dart';
class LoginScreenBody extends StatefulWidget {
   LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> with SingleTickerProviderStateMixin {
  var  emailController=TextEditingController();

   GlobalKey<FormState> formKey=GlobalKey<FormState>();

   int value=0;
 late Animation<double> animation;
 late AnimationController animationController;
   @override
  void initState() {
    // TODO: implement initState
     animationController=AnimationController(vsync:this,
     duration: const Duration(seconds: 10));
      animation=Tween<double>(
       begin: 0,
       end: 100
     ).animate(animationController);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child:Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20
            ),
            child: Form(
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
                  Text('Let''\'s Get Started',style:
                    AppTextStyles.styleSemiBold24(context), ),
                  const   SizedBox(height: 20,),
                  CustomTextFormField(
                    prefix:const Icon(Icons.alternate_email_outlined,),
                    controller:emailController ,
                    hintText: 'Email Address',
                    textInputType: TextInputType.emailAddress,

                    validator: (string)
                    {
                      if(string!.isEmpty)
                      {
                        return 'Email must Not be Empty';
                      }
                      return null;
                    },

                  ),
                  const  SizedBox(height: 20,),
                  PasswordFormField(),
                  const   SizedBox(height: 20,),
                    CustomTextButton(
                    text: 'Forget Password ?',
                    onPressed: (){},

                  ),
                  ConditionalBuilder(
                    condition: true,
                    builder: (context) {
                      return SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: CustomMaterialButton(

                          onPressed: (){
                            if(formKey.currentState!.validate())
                              {

                              }
                          },
                          text: 'Login',
                          radius: 15 ,),
                      );
                    },
                    fallback: (context)=>  AnimatedBuilder(
                        animation:animationController ,

                      builder: (context,widget) {
                          print(animation.value);
                          if(animation.value==100)
                            {

                             animationController.reverse();
                            }
                          else if(animation.value==0)
                            {
                              animationController.forward();
                            }

                        return  Center(child:   CustomCircleIndicator(
                          value: animation.value,
                          backColor: Colors.red,
                          size: 50,
                          showValue: false,
                          checkOnFinish: false,
                        ),);
                      }
                    ),
                  ),
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




