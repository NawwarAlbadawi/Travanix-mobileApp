import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class RoomRating extends StatelessWidget {
  const RoomRating({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const  Icon(FontAwesomeIcons.solidStar,
          color: navyBlueColor,
        ),
        const SizedBox(width: 10,),
        Text('${4.5}',
          style:AppTextStyles.styleMedium14(context).copyWith(
              fontWeight: FontWeight.bold,
              color: navyBlueColor
          ),)
      ],
    );
  }
}
