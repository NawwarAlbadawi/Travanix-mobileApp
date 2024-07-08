import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/restaurant/data/models/restaurant_data.dart';
import 'package:travanix/Features/restaurant/presentation/views/widgets/restauratn_favorite_button.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/custom_image.dart';
import '../../../../../constants.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../hotels/presentation/views/widgets/rating_bar.dart';
class RestaurantListItem extends StatelessWidget {
  const RestaurantListItem({super.key, required this.model});
 final RestaurantData model;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
       onTap: (){
         GoRouter.of(context).push(AppRouter.restaurantView,extra: model);
       },
      child: SizedBox(
        height:MediaQuery.sizeOf(context).height*0.2,
        child:  Container(
          decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(basicRadius),
              boxShadow:const  [BoxShadow(
                    color: CupertinoColors.extraLightBackgroundGray,
                    blurRadius: 10

                )]
          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width*0.39,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(basicRadius),
                  child: CustomImage(aspectRatio: 0.9,image: url+model.images[0],),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8,bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                width: MediaQuery.sizeOf(context).width*0.4,
                      child: Text(model.name,style: AppTextStyles.styleSemiBold24(context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,),
                    ),
                    const SizedBox(height: 10,),
                    Text(model.cityName,style: AppTextStyles.styleSemiBold16(context).copyWith(
                        color: navyBlueColor.withOpacity(0.4)
                    ),),
                    const Spacer(),
                     CustomRating(rating: model.rating,iconSize: 20,color: basicColor,),
                    const SizedBox(height: 10 ,)
                  ],),
              ),
              const Spacer(),
               RestaurantFavoriteButton(id: model.id),

            ],
          ),

        ),
      ),
    );
  }
}