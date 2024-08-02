
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/profile/data/models/ProfileModel.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';


class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.text, required this.icon, this.model, required this.router});
  final String text;
  final IconData icon;
  final ProfileModel ? model;
  final String router;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){

            GoRouter.of(context).push(router);


      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Icon(icon,
            color: basicColor,),
            const SizedBox(width: 10,),
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