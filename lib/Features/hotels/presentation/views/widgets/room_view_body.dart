import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:travanix/Features/hotels/presentation/views/widgets/room_images_list.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/room_info.dart';
import 'package:travanix/core/styles/app_colors.dart';

class RoomViewBody extends StatefulWidget {
  const RoomViewBody({super.key});

  @override
  State<RoomViewBody> createState() => _RoomViewBodyState();
}

class _RoomViewBodyState extends State<RoomViewBody> {
   PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [

       RoomImagesList(pageController: pageController),
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
        const  RoomInfo()

      ],
    );
  }
}



