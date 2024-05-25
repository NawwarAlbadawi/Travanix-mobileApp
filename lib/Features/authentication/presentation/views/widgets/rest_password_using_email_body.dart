import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/authentication/presentation/views_models/cubit/check_email/check_email_cubit.dart';
import 'package:travanix/core/generated/assets.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/cache_service.dart';

import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/core/widgets/custom_toast.dart';


class RestPasswordUsingEmailBody extends StatefulWidget {
  const RestPasswordUsingEmailBody({super.key});

  @override
  State<RestPasswordUsingEmailBody> createState() =>
      _RestPasswordUsingEmailBodyState();
}

class _RestPasswordUsingEmailBodyState
    extends State<RestPasswordUsingEmailBody> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState>formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckEmailCubit(),

      child: BlocConsumer<CheckEmailCubit,CheckEmailState>(
          listener:(context,state)
              async {
                if(state is CheckEmailSuccess)
                  {
                    if(state.model.status==0)
                      {
                        const CustomToast().build(context: context, text:state.model.message,
                            color: Colors.red);
                      }
                    else
                      {
                        await CacheHelper.setInCacheHelper(value: state.model.accessToken, key: 'restPasswordToken');
                        context.pushNamed(
                            'otpScreen',
                            pathParameters: {
                              'email':emailController.text,
                              'name':  '0',
                              'password':'0',
                              'fromWhere': 'fromRestPassword'});
                      }
                  }
                else if(state is CheckEmailError)
                  {
                    const CustomToast().build(context: context, text:state.err,
                        color: Colors.red);
                  }

               },
        builder: (context,state)
        {
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
                        width: double.infinity,
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
                      width: double.infinity,
                      height: 45,

                      child: CustomMaterialButton(
                        onPressed: () {
                          CheckEmailCubit.get(context).checkEmail(email:emailController.text );
                        },
                        text: 'Continue',
                        radius: 15,
                      ),
                    )

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
