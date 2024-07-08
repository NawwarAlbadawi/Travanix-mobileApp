
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/Features/restaurant/data/models/restaurant_info_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';

class AboutRestaurantListItem extends StatelessWidget {
  const AboutRestaurantListItem({
    super.key, required this.model,
  });

  final RestaurantInfoModel model;

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
           CircleAvatar(
            backgroundColor:Colors.white,
            child: Icon(model.icon,color: basicColor,),
          ),
          const SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(model.title,style: AppTextStyles.styleSemiBold20(context).copyWith(
                  color: navyBlueColor.withOpacity(0.6)
              ),),
              Text(model.subTitle,style: AppTextStyles.styleSemiBold18(context),),
            ],
          )
        ],),
    );
  }
}