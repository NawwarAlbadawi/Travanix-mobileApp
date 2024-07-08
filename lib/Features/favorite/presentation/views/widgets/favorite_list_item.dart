
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/favorite/data/models/FavoriteModel.dart';
import 'package:travanix/Features/favorite/presentation/views/widgets/favorite_icon_button.dart';
import 'package:travanix/Features/favorite/presentation/views_model/favorite_cubit.dart';
import 'package:travanix/Features/hotels/data/models/hotel_data_model.dart';
import 'package:travanix/Features/restaurant/data/models/restaurant_data.dart';
import 'package:travanix/constants.dart';

import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/custom_image.dart';
import 'package:travanix/core/widgets/rating_bar.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({super.key, this.model, this.id, required this.index});

  final dynamic model;
  final int ?id;
  final int index;
  

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FavoriteCubit,FavoriteState>(
      builder: (context,state) {

        return GestureDetector(
          onTap: (){
            if(model is HotelData)
              {
                GoRouter.of(context).push(AppRouter.hotelView,extra: model);
              }
            else if (model is RestaurantData)

              {
                GoRouter.of(context).push(AppRouter.restaurantView,extra: model);
              }
          },
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height*0.19,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:   CustomImage(image: url+model.images[0], aspectRatio: 1,fit: BoxFit.fill,)),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(model.name,style: AppTextStyles.styleSemiBold20(context).copyWith(
                    fontSize: 22
                  ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10,),
                  Text(model.cityName,style: AppTextStyles.styleSemiBold16(context).copyWith(
                    color: greyColor
                  ),),
                  const Spacer(),
                   CustomRatingBar(rating: model.rating,ratingColor: navyBlueColor,ignoreTouch: true,size: 25,)
                ],),
              ),

              FavoriteIconButton(id: model.id,)



            ],),
          ),
        );
      }
    );
  }
}
