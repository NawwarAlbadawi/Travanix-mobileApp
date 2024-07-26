import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';


class HotelClassListItem extends StatelessWidget {
  const HotelClassListItem({super.key, required this.star, required this.isActive});
  final int star;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(basicRadius),
           border: isActive?Border.all(color: navyBlueColor):null,
          boxShadow: const  [
            BoxShadow(
                color: CupertinoColors.lightBackgroundGray,
                blurRadius: 2
            )
          ]
      ),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const  Icon(CupertinoIcons.star_fill,color: Colors.yellow,),
          const  SizedBox(width: 5,),
          Text('$star',style: AppTextStyles.styleSemiBold16(context),)
        ],
      ),
    );
  }
}