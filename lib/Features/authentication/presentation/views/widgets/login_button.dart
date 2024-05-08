import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:travanix/Features/authentication/presentation/views/widgets/Custom_circle_Indicator.dart';
import 'package:travanix/Features/authentication/presentation/views/widgets/login_screen_body.dart';
import 'package:travanix/Features/authentication/presentation/views/widgets/password_form_field.dart';
import 'package:travanix/Features/authentication/presentation/views_models/cubit/post_login_data_cubit.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_toast.dart';
class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.formKey,});

  final GlobalKey<FormState> formKey;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostLoginDataCubit(),

      child: BlocConsumer<PostLoginDataCubit, PostLoginDataState>(
        listener: (context, state) {
          if(state is PostLoginDataSuccessState)
            {

              const  CustomToast().build(context: context,color: Colors.green,text: 'Welcome Back');


              //GoRouter.of(context).pushReplacement(AppRouter.travanixLayoutView);
            }
          else if (state is PostLoginDataErrorState)
            {
             const CustomToast().build(context: context,color: Colors.red,text: 'Error');

            }
          // TODO: implement listener
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is PostLoginDataLoadingState,
            builder: (context) {
              return const CircleIndicator();
            },
            fallback: (context) => SizedBox(
              width: double.infinity,
              height: 45,
              child: CustomMaterialButton(

                onPressed: () {
                  if (formKey.currentState!.validate()) {



                    PostLoginDataCubit.get(context).postLoginData(email:LoginScreenBody.emailController.text , password: PasswordFormField.passwordController.text);

                  }
                },
                text: 'Login',
                radius: 15,),
            ),
          );
        },
      ),
    );
  }
}
