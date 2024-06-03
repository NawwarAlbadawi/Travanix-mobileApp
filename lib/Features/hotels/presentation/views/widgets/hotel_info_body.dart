



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/rating_bar.dart';

import 'package:travanix/Features/hotels/presentation/views/widgets/hotel_services_list.dart';
import 'package:travanix/Features/map/presentation/views/wiggets/map_view_body.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
class HotelInfoBody extends StatelessWidget {
  const HotelInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.center,
            child: Container(
              height: 5,
              width: MediaQuery.sizeOf(context).width*.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: navyBlueColor
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text('Burj Al Arab',
            style: AppTextStyles.styleBold35(context),),
          const SizedBox(height: 10,),
          const CustomRating(),
          const SizedBox(height: 20,),
          Text('A hotel thats home to cutting-edge engineering from the unique man-made beach and infinity pool terrace, to one of the tallest grand',
            style: AppTextStyles.styleMedium16(context),),
          const SizedBox(height: 20,),
          const  HotelServicesList(),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              GoRouter.of(context).push(AppRouter.mapView);
            },
            child:   AspectRatio(
              aspectRatio: 3,
              child: Container(
                height: MediaQuery.sizeOf(context).height*.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: greyColor,

                    ),
                    boxShadow: [
                      BoxShadow(
                          color: navyBlueColor.withOpacity(0.4),
                          offset: const Offset(0,2),
                          blurStyle: BlurStyle.normal,
                          blurRadius: 15
                      )
                    ]

                ),
                width: double.infinity,

                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child:const  IgnorePointer(
                        ignoring: true,
                        child:  MapViewBody())),
              ),
            ),
          ),
          const SizedBox(height: 30,),



        ],
      ),




    );
  }


}


