import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/Features/tourist_places/data/models/tourist_places_model_data.dart';
import 'package:travanix/Features/tourist_places/presentation/views/widgets/tourist_places_favorit_icon.dart';
import 'package:travanix/core/widgets/custom_item_box_location.dart';

import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../Review/review_body.dart';
class TouristPlaceInfo extends StatelessWidget {
  const TouristPlaceInfo({super.key, required this.model});

  final AttractionActivitiesModelData model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(model.name!,style: AppTextStyles.styleSemiBold24(context),),
              const Spacer(),
               TouristPlacesFavoriteIcon(id: model.id!)
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 8,
            horizontalTitleGap: 5,
            enabled: false,

            leading:const  Icon(FontAwesomeIcons.locationDot,size: 18,color: basicColor,),
            title: Text('${model.cityName},${model.nationName}',style: AppTextStyles.styleSemiBold18(context).copyWith(
                color: greyColor
            ),),
          ),


          const SizedBox(height: 40,),
          Row (
            children: [
              Icon(IconlyBold.time_circle,color:basicColor.withOpacity(0.7)),
              const SizedBox(width: 5,),
              Text('Opening & Closing time',style: AppTextStyles.styleSemiBold20(context),),
            ],
          ),
          const SizedBox(height: 5,),
          Text('${model.openingTime} - ${model.closingTime}',style: AppTextStyles.styleBold18(context).copyWith(
              color: basicColor.withOpacity(0.7),
              fontWeight: FontWeight.w500

          ),),
          const SizedBox(height: 20,),
          CustomItemBoxLocation(model: model,aspectRatio: 2.3,),

          const SizedBox(height: 20,),
          Text('Description',style: AppTextStyles.styleSemiBold24(context).copyWith(
              fontSize: 22
          ),),
          const SizedBox(height: 10,),
          Text(model.description!,
            style: AppTextStyles.styleMedium16(context).copyWith(
              color: greyColor
            ),

          ),
          const SizedBox(height: 30,),
          ReviewBody(category: 'attraction_activity_id', id:model.id!)



        ],
      ),
    );
  }
}
