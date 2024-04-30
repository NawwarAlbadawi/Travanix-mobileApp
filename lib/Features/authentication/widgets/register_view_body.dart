import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/generated/assets.dart';
class RegisterViewBody extends StatefulWidget {
   RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  var  passwordController=TextEditingController();
  var  emailController=TextEditingController();
   var  confirmPasswordController=TextEditingController();
  var  nameController=TextEditingController();
   Icon ? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
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
            Text('Let''\'s Get Started',style:
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
            CustomTextFormField(
              prefix:const Icon(Icons.lock_outline_rounded,),
              controller:passwordController ,
              hintText: 'Password',

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

                },
                text: 'Sign Up',
                radius: 20,),
            ),

          ],
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
