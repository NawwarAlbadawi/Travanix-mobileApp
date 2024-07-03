
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';

class RestaurantListItem extends StatelessWidget {
  const RestaurantListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(basicRadius),
          color: greyColor.withOpacity(0.2)
      ),
      padding: const EdgeInsets.all(15),
      child: Row(

        children: [
          const CircleAvatar(
            backgroundColor:Colors.white,
            child: Icon(IconlyBold.star,color: basicColor,),
          ),
          const SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Rating',style: AppTextStyles.styleSemiBold20(context).copyWith(
                  color: navyBlueColor.withOpacity(0.6)
              ),),
              Text('4.8',style: AppTextStyles.styleSemiBold18(context),),
            ],
          )
        ],),
    );
  }
}