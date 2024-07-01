
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/hotels/data/models/hotels_model.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/rating_bar.dart';


class MapItemDetails extends StatelessWidget {
  const MapItemDetails({super.key, this.hotelData});
 final dynamic hotelData;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: (){
          if(hotelData!=null)
            {
              GoRouter.of(context).push(AppRouter.hotelView,
              extra: hotelData);
            }
        },
        child: Container(
          decoration: BoxDecoration(
            color: navyBlueColor,
            borderRadius: BorderRadius.circular(20),
          ),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height*.2
          ),

          width: double.infinity,
          child: ConditionalBuilder(
            condition: hotelData !=null,
            builder: (context) {
              return SingleChildScrollView(
                physics:const  BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width*.3,
                        child:  AspectRatio(
                          aspectRatio: 0.8,
                          child:  ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child:  Image(image: NetworkImage(
                                'http://$ip:8001${hotelData!.images[0]}'
                            ), fit: BoxFit.fill,),
                          ) ,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          const SizedBox(width: 5,),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width*.4,
                            child: Text(hotelData!.name, style: AppTextStyles.styleSemiBold24(context).copyWith(color: basicColor,),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,),
                          ),
                          const  SizedBox(height: 5,),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width*.4,
                            child: Text(hotelData!.simpleDescriptionAboutHotel, style: AppTextStyles.styleSemiBold16(context).copyWith(color: greyColor,),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,),
                          ),
                          const  SizedBox(height: 10,),
                           IgnorePointer(
                            ignoring: true,
                            child: CustomRatingBar(
                              rating: hotelData!.rating,
                            ),
                          )
                        ],
                      ),












                    ],
                  ),
                ),
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