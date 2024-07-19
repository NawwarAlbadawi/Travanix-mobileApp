import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/Features/Review/review_body.dart';

import 'package:travanix/Features/restaurant/presentation/views/widgets/about_restaurant_list_view.dart';
import 'package:travanix/Features/restaurant/presentation/views/widgets/restauratn_favorite_button.dart';

import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/custom_item_box_location.dart';

import '../../../data/models/restaurant_data.dart';
class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({super.key, required this.model,});
  final RestaurantData model;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(model.name,style: AppTextStyles.styleSemiBold24(context),),
              const Spacer(),
              RestaurantFavoriteButton(id: model.id)
            ],
          ),
          Text(model.address,style: AppTextStyles.styleSemiBold20(context).copyWith(
              color: greyColor
          ),),
          const SizedBox(height: 30,),
            AboutRestaurantListView(model: model,),
          const SizedBox(height: 40,),
          Row(
            children: [
              Icon(IconlyBold.time_circle,color:basicColor.withOpacity(0.7)),
              const SizedBox(width: 5,),
              Text('Working hours',style: AppTextStyles.styleSemiBold20(context),),
            ],
          ),
          const SizedBox(height: 5,),
          Text('Mon-Sun/ ${model.opiningTime}- ${model.closingTime}',style: AppTextStyles.styleBold18(context).copyWith(
              color: basicColor.withOpacity(0.7),
              fontWeight: FontWeight.w500

          ),),
          const SizedBox(height: 20,),
          CustomItemBoxLocation(aspectRatio: 2.3,model: model,),
          const SizedBox(height: 20,),
          Text('About restaurant',style: AppTextStyles.styleSemiBold24(context).copyWith(
              fontSize: 22
          ),),
          const SizedBox(height: 10,),
          Text(model.description,
            style: AppTextStyles.styleMedium16(context),

          ),
          const SizedBox(height: 30,),
           ReviewBody(category: 'restaurant_id', id:model.id)



        ],
      ),
    );
  }
}