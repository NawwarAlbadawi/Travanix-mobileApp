
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/profile/data/models/ProfileModel.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.text, required this.icon, this.model});
  final String text;
  final IconData icon;
  final ProfileModel ? model;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        if(text=='Edit Your password')
          {
            GoRouter.of(context).push(AppRouter.restPasswordUsingEmail);
          }
        else if(text=='See your Wallet')
          {
            GoRouter.of(context).push(AppRouter.walletView,extra: model);

          }
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Icon(icon,
            color: basicColor,),
            const Spacer(),
            Text(text,style: AppTextStyles.styleSemiBold24(context),),
            const Spacer(),
           const  Icon(Icons.arrow_forward_ios_rounded,
           color: basicColor,)

          ],
        ),
      ),
    );
  }
}