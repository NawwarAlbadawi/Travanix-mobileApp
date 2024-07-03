
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/styles/app_colors.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({super.key, required this.pageController, required this.count, this.color});
 final PageController pageController;
 final int count;
 final Color ?color;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller:pageController , count: count,
      effect:  SlideEffect(
          dotColor: greyColor,
          dotHeight: 12,
          dotWidth: 12,
          activeDotColor:color?? basicColor


      ),
    );
  }
}
