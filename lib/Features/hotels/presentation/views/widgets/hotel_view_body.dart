import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travanix/Features/hotels/data/models/hotels_model.dart';

import 'package:travanix/Features/hotels/presentation/views/widgets/hotel_images_list.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotel_info.dart';
import 'package:travanix/core/styles/app_colors.dart';

class HotelViewBody extends StatelessWidget {
   const HotelViewBody({super.key, required this.hotelData, required this.pageController});

  final HotelData hotelData;

  final PageController pageController ;

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [

       HotelImagesList(pageController: pageController),
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top:25.0),
            child: SmoothPageIndicator(
                controller:pageController , count: 3,
                effect:const  SlideEffect(
                    dotColor: greyColor,
                    dotHeight: 12,
                    dotWidth: 12,
                    activeDotColor: basicColor


                ),
              ),

          ),
        ),
          HotelInfo(hotelData: hotelData,)

      ],
    );
  }
}



