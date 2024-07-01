import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:travanix/Features/favorite/presentation/views/widgets/custom_page_indicator.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotel_info.dart';

import 'package:travanix/core/widgets/custom_page_view.dart';

import '../../../data/models/hotel_data_model.dart';

class HotelViewBody extends StatelessWidget {
   const HotelViewBody({super.key, required this.hotelData, required this.pageController});

  final HotelData hotelData;

  final PageController pageController ;

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [

        CustomPageView(pageController: pageController,images: hotelData.images,),
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top:25.0),
            child: CustomPageIndicator(count: hotelData.images.length,pageController: pageController,),

          ),
        ),
        HotelInfo(hotelData: hotelData,)

      ],
    );
  }
}



