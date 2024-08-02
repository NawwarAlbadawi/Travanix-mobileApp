
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:travanix/Features/hotels/data/models/hotel_data_model.dart';

import 'package:travanix/Features/restaurant/data/models/restaurant_data.dart';
import 'package:travanix/Features/tourist_places/data/models/tourist_places_model_data.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/rating_bar.dart';


class MapItemDetails extends StatelessWidget {
  const MapItemDetails({super.key, this.modelData});
 final dynamic modelData;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left:10,right: 10,bottom: 5),
      child: GestureDetector(
        onTap: (){
          if(modelData!=null)
            {
              if(modelData is HotelData)
                {
              GoRouter.of(context).push(AppRouter.hotelView, extra: modelData);}

              else if(modelData is RestaurantData)
                {
                  GoRouter.of(context).push(AppRouter.restaurantView, extra: modelData);
                }
              else if (modelData is AttractionActivitiesModelData)
                {
                  GoRouter.of(context).push(AppRouter.touristPlacesView, extra: modelData);
                }

            }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height*.2
          ),

          width: double.infinity,
          child: ConditionalBuilder(
            condition: modelData !=null,
            builder: (context) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width*.35,
                    height: MediaQuery.sizeOf(context).height*.2,
                    child:  ClipRRect(
                      borderRadius:const  BorderRadius.only(topLeft:  Radius.circular(12),bottomLeft: Radius.circular(12)),
                      child:  Image(image: NetworkImage(
                          'http://$ip:8001${modelData!.images[0]}'
                      ), fit: BoxFit.fill,),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 5,),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width*.56,
                                child: Text(modelData!.name, style: AppTextStyles.styleSemiBold24(context).copyWith(color: basicColor,fontSize: 22),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,),
                              ),
                              const  SizedBox(height: 10,),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width*.55,
                                child: Text(modelData!.description, style: AppTextStyles.styleSemiBold16(context).copyWith(color: greyColor,),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,),
                              ),],
                          ) ,),
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            const  Spacer(),
                            CustomRatingBar(
                              ignoreTouch: true,
                              rating: modelData!.rating,
                            )
                          ],),
                        )
                      ],
                      
                    ),
                  ),












                ],
              );
            },
            fallback: (context){
             return Padding(
               padding: const EdgeInsets.all(20.0),
               child: Text('There is no data about this site',
                style: AppTextStyles.styleSemiBold24(context).copyWith(
                  color: basicColor
                ),),
             );
            },
          ),
        ),
      ),
    );
  }
}