import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/authentication/presentation/views_models/cubit/reset_password/reset_password_cubit.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/core/widgets/custom_toast.dart';
import 'package:travanix/generated/assets.dart';

class RestPasswordViewBody extends StatefulWidget {
  const RestPasswordViewBody({super.key});

  @override
  State<RestPasswordViewBody> createState() => _RestPasswordViewBodyState();
}

class _RestPasswordViewBodyState extends State<RestPasswordViewBody> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Icon ? suffixIcon;
  GlobalKey<FormState>formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if(state is ResetPasswordSuccess)
            {
              const CustomToast().build(context: context, text:'Reset password successfully',
                  color: Colors.green);
              GoRouter.of(context).pushReplacement(
                  AppRouter.loginScreen);
            }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
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
                                    Assets.imagesRestPassword
                                )
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text('Enter new  password', style:
                    AppTextStyles.styleSemiBold24(context),),
                    const SizedBox(height: 20,),
                    CustomTextFormField(
                      prefix: const Icon(Icons.lock_outline_rounded,),
                      controller: passwordController,
                      hintText: 'New Password',
                      textInputType: TextInputType.visiblePassword,

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is a required field';
                        }
                        else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                      onChange: onChangedPassword,

                    ),
                    const SizedBox(height: 20,),
                    CustomTextFormField(
                      prefix: const Icon(Icons.lock_outline_rounded,),
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      suffix: suffixIcon,
                      onChange: onChangedPassword,
                      textInputType: TextInputType.visiblePassword,


                      validator: (string) {
                        if (string!.isEmpty) {
                          return ' Confirm password is a required field';
                        }
                        else if (string != passwordController.text) {
                          return 'Your password and confirmation password do not match';
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
                          if (formKey.currentState!.validate()) {
                           ResetPasswordCubit.get(context).resetPassword(password: passwordController.text);
                          }
                        },
                        text: 'Rest password',
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

  onChangedPassword(string) {
    if (confirmPasswordController.text == passwordController.text) {
      suffixIcon = const Icon(Icons.check_circle_outline, color: Colors.green,);
    }
    else if (confirmPasswordController.text != passwordController.text &&
        confirmPasswordController.text.isNotEmpty) {
      suffixIcon = const Icon(Icons.error_outline, color: Colors.red,);
    }
    else {
      suffixIcon = null;
    }
    setState(() {

    });
  }
}
