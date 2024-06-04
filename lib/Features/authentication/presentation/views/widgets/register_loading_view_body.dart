
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/authentication/presentation/views_models/cubit/register_cubit/post_register_data_cubit.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/cache_service.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/custom_toast.dart';

class RegisterLoadingViewBody extends StatelessWidget {
  const RegisterLoadingViewBody({super.key, required this.name, required this.email, required this.password});

  final String name;
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocProvider(
        create:(context)=>PostRegisterDataCubit()..postRegisterData(email:email , password: password, name: name),
        child: BlocConsumer<PostRegisterDataCubit,PostRegisterDataState>(
          listener: (context,state){
            if(state is PostRegisterDataSuccess)
              {
                const  CustomToast().build(context: context,color: Colors.green,text: 'Hello $name');
                CacheHelper.setInCacheHelper(value: state.model.accessToken, key:'token').then((value) {
                  GoRouter.of(context).pushReplacement(AppRouter.travanixLayoutView);
                });

              }
            else if(state is PostRegisterDataFail)
              {
                const  CustomToast().build(context: context,color: Colors.red,text: state.errorMessage);
                context.pushReplacement(AppRouter.registerScreen);
              }
          },
          builder: (context,state)
          {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Just wait a few second to create your account',
                  style: AppTextStyles.styleSemiBold24(context),),
                const SizedBox(height: 30,),
                const CircularProgressIndicator(
                  color: basicColor,
                )
              ],
            );
          },

        ),
      ),
    );
  }
}
