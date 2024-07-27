import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/profile/presentation/views/widgets/profile_list.dart';
import 'package:travanix/Features/profile/presentation/views_model/profile_cubit.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/generated/assets.dart';
class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<ProfileCubit,ProfileState>(
        builder: (context,state){
          if(state is GetProfileDataSuccess)
            {
              return    SingleChildScrollView(
                child: Padding(
                  padding:const  EdgeInsets.symmetric(horizontal: 20.0,
                  vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     const  Center(
                        child: CircleAvatar(
                          radius:60,
                        backgroundColor: basicColor,
                        backgroundImage:  AssetImage(
                          Assets.imagesLogo,

                        )
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text('${state.profileModel.touristName}',
                        style: AppTextStyles.styleSemiBold24(context),),
                      Text('${state.profileModel.emailAddress}',
                        style: AppTextStyles.styleMedium20(context).copyWith(
                          color:basicColor
                        ),),
                     const SizedBox(height: 50,),
                     const ProfileList()
                    ],
                  )
                ),
              );
            }
          return const  Center(child:  CircularProgressIndicator());

        });
  }
}



