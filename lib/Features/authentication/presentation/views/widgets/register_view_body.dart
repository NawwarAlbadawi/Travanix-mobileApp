import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';

import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/generated/assets.dart';
class RegisterViewBody extends StatefulWidget {
 const  RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  var  passwordController=TextEditingController();
  var  emailController=TextEditingController();
  var  confirmPasswordController=TextEditingController();
  var  nameController=TextEditingController();
  Icon ? suffixIcon;
  GlobalKey<FormState>  formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
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
                              Assets.imagesSignUp
                          )
                      )
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Text('Let''\'ts Get Started',style:
              AppTextStyles.styleSemiBold24(context), ),
              const   SizedBox(height: 20,),
              CustomTextFormField(
                prefix:const Icon(FontAwesomeIcons.user),
                controller:nameController ,
                hintText: 'Full Name',

                validator: (string)
                {
                  if(string!.isEmpty)
                  {
                    return 'Name must Not be Empty';
                  }
                  return null;
                },

              ),
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
              CustomTextFormField(
                prefix:const Icon(Icons.lock_outline_rounded,),
                controller:passwordController ,
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,

                validator: (value)
                {
                  if(value!.isEmpty)
                  {
                    return 'Password must Not be Empty';
                  }
                  return null;
                },
                onChange: onChangedPassword,

              ),
              const   SizedBox(height: 20,),
              CustomTextFormField(
                prefix:const Icon(Icons.lock_outline_rounded,),
                controller:confirmPasswordController ,
                hintText: 'Confirm Password',
                suffix: suffixIcon,
                onChange: onChangedPassword,
                textInputType: TextInputType.visiblePassword,


                validator: (string)
                {
                  if(string!.isEmpty)
                  {
                    return ' Confirm Password must Not be Empty';
                  }
                  else if (string!=passwordController.text)
                    {
                      return 'Confirm Password Doesn''\t Match';
                    }
                  return null;
                },

              ),
              const   SizedBox(height: 20,),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: CustomMaterialButton(
                  onPressed: (){
                    if(formKey.currentState!.validate())
                      {
                        GoRouter.of(context).pushNamed('otpScreen',pathParameters: {
                          'email':emailController.text,
                          'fromWhere':'fromSignUp'} );
                        toastification.show(
                            title: const Text('OK'),
                            backgroundColor: Colors.red,
                          applyBlurEffect: true,
                          showProgressBar: false,
                          style: ToastificationStyle.flat,
                          autoCloseDuration:const Duration(seconds: 2),
                          dragToClose: true,

                        );

                      }

                  },
                  text: 'Sign Up',
                  radius: 20,),
              ),

            ],
          ),
        ),
      ),
    );
  }

  onChangedPassword(string){

            if(confirmPasswordController.text==passwordController.text){
              suffixIcon=const Icon(Icons.check_circle_outline,color: Colors.green,);



            }
            else {
              suffixIcon=null;
            }
            setState(() {

            });
          }


}
