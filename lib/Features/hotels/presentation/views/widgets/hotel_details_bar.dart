import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travanix/core/styles/app_colors.dart';

class HotelDetailsBar extends StatelessWidget {
  const HotelDetailsBar({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [


          SmoothPageIndicator(
            controller:pageController , count: 3,
            effect:const  SlideEffect(
                dotColor: greyColor,
              dotHeight: 12,
              dotWidth: 12,
              activeDotColor: basicColor


            ),
          ),



        ],
      ),
    );
  }
}
