import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/generated/assets.dart';


  SingleChildScrollView buildEnterEmailBody({required BuildContext context,
  required GlobalKey formKey, required TextEditingController emailController,
    required Function () onPress

  }) {
    return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            AspectRatio(
              aspectRatio: 1,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            Assets.imagesEmail
                        )
                    )
                ),
              ),


            ),
            Text('Enter Your Email', style:
            AppTextStyles.styleSemiBold24(context),),
            const SizedBox(height: 20,),
            CustomTextFormField(
              prefix: const Icon(Icons.email_outlined,),
              controller: emailController,
              hintText: 'Email Address',
              textInputType: TextInputType.emailAddress,
              onChange: (value) {

              },

              validator: (string) {
                if (string!.isEmpty) {
                  return 'Email must Not be Empty';
                }
                return null;
              },

            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 45,

              child: CustomMaterialButton(
                onPressed:onPress ,
                text: 'Continue',
                radius: 15,
              ),
            )

          ],
        ),
      ),
    ),
  );
  }
