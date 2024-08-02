
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/hotels/data/models/hotel_data_model.dart';

import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/custom_image.dart';
import 'package:travanix/core/widgets/rating_bar.dart';

import 'hotel_favorite_button.dart';
class HotelsItem extends StatelessWidget {
  const HotelsItem({super.key, required this.hotelModel});

  final HotelData hotelModel;


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.hotelView,
        extra: hotelModel);
      },
      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(basicRadius),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: navyBlueColor.withOpacity(0.4),
                  offset: const Offset(0,2),
                  blurRadius: (5),
                  blurStyle: BlurStyle.normal
              )
            ]

        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(basicRadius),
                       topRight: Radius.circular(basicRadius) ),
                  child: CustomImage(
                    aspectRatio: 2.1,
                    image: '$url${hotelModel.images[0]}',
                    fit: BoxFit.fill,
                  ),
                ),
                HotelFavoriteButton(
                  id: hotelModel.id,
                ),
              ],
            ),
            const SizedBox(height: 2,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:  8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hotelModel.name,style: AppTextStyles.styleSemiBold24(context).copyWith(

                          fontSize: 22
                      ),),

                      Row(



                        children: [
                         const  Icon(Icons.location_on_outlined,color: basicColor,size: 18,),
                          Text(hotelModel.cityName,
                            style: AppTextStyles.styleMedium16(context).copyWith(
                                color: greyColor,
                              fontWeight: FontWeight.w600
                            ),),
                        ],
                      ),
                      const SizedBox(height: 8,),

                      CustomRatingBar(rating: hotelModel.rating,
                      size: 20,),
                    ],
                  ),
                 const  Spacer(),
                  Text('\$120/night',style: AppTextStyles.styleSemiBold18(context),),
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}