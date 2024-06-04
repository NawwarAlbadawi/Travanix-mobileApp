import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/profile/presentation/views/profile_item.dart';
import 'package:travanix/Features/profile/presentation/views_model/profile_cubit.dart';
import 'package:travanix/constants.dart';
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
                        style: AppTextStyles.styleSemiBold20(context),),
                     const SizedBox(height: 50,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(basicRadius),
                          border: Border.all(
                            color: navyBlueColor
                          ),
                          boxShadow:const  [
                            BoxShadow(
                              color: greyColor,
                              offset: Offset(0,2),
                              blurRadius: 5
                            )
                          ]

                        ),

                        child:const Column(
                          children: [
                            ProfileItem(text: 'See your Information', icon: Icons.perm_identity_outlined),
                             Divider(
                               thickness: 3,
                             ),
                            ProfileItem(text: 'See your Wallet', icon: Icons.wallet),
                            Divider(
                              thickness: 3,
                            ),
                            ProfileItem(text: 'Edit Your password', icon: Icons.password),
                          ],
                        ) ,
                      )

                    ],
                  ),
                ),
              );
            }
          return const  Center(child:  CircularProgressIndicator());

        });
  }
}



