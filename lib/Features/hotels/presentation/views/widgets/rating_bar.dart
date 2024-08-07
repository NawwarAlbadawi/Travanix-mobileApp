import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class CustomRating extends StatelessWidget {
  const CustomRating({super.key, this.color, this.rating, this.iconSize});
  final Color ? color;
  final double ? rating;
  final  double ? iconSize;

  @override
  Widget build(BuildContext context) {
    return  FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
            Icon(FontAwesomeIcons.solidStar, color: color??navyBlueColor,size: iconSize,),
          const SizedBox(width: 10,),
          Text(rating!=null? '$rating' :'0',
            style:AppTextStyles.styleMedium14(context).copyWith(
                fontWeight: FontWeight.bold,
                color: color??navyBlueColor
            ),)
        ],
      ),
    );
  }
}
