import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/tourist_places/data/models/tourist_places_model_data.dart';
import 'package:travanix/Features/tourist_places/presentation/views/widgets/tourist_places_favorit_icon.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/custom_image.dart';

import '../../../../../constants.dart';
class AllTouristPlacesListItem extends StatelessWidget {
  const AllTouristPlacesListItem({super.key, required this.model});
 final AttractionActivitiesModelData model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.touristPlacesView,extra: model);
      },
      child: Padding(
        padding: const EdgeInsets.all( 20),
        child: Container(
          constraints: const  BoxConstraints(
            maxHeight: 120
          ),
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(basicRadius),

            boxShadow: const  [
              BoxShadow(
                color: CupertinoColors.extraLightBackgroundGray,
                blurRadius: 5
              )
            ]
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomImage(image: 'http://$ip:8001 ${model.images![0]}'   , aspectRatio: 1,clipBorderRadius: BorderRadius.circular(basicRadius),),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.name!,style: AppTextStyles.styleSemiBold18(context),maxLines: 2,overflow: TextOverflow.ellipsis,),
                       const SizedBox(height: 5,),
                       Text(model.nationName!,style: AppTextStyles.styleMedium16(context).copyWith(
                         color: navyBlueColor.withOpacity(0.5)
                       ),
                         overflow: TextOverflow.ellipsis,
                       ),
                      const SizedBox(height: 2,),
                     Text(model.cityName!,style: AppTextStyles.styleMedium16(context).copyWith(
                         color: navyBlueColor.withOpacity(0.5)
                     ),)
                  ],),
                ),
              ),
              const Spacer(),
              Expanded(child: TouristPlacesFavoriteIcon(id: model.id!)),
              const SizedBox(width: 5,)
            ],
          ),
        ),
      ),
    );
  }
}
