
import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
    );
  }
}