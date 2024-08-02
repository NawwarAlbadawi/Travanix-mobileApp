import 'package:flutter/material.dart';
import 'package:travanix/Features/favorite/presentation/views/widgets/custom_page_indicator.dart';
import 'package:travanix/core/widgets/custom_page_view.dart';
class RestaurantPageView extends StatelessWidget {
  const RestaurantPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController=PageController();
    return  Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomPageView(
          pageController: pageController,
          images: const  [
            //Assets.imagesTest2,
            "/images/hotels/Burj Al Arab1.jpg",
            "/images/hotels/Burj Al Arab2.jpg",
            "/images/hotels/Burj Al Arab3.jpg",
            "/images/hotels/Burj Al Arab4.jpg",
            "/images/hotels/Burj Al Arab5.jpg",
            "/images/hotels/Burj Al Arab6.jpg",
            "/images/hotels/Burj Al Arab7.jpg",
            "/images/hotels/Burj Al Arab8.jpg"
          ],
          heightRatio: 0.42,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: CustomPageIndicator(pageController: pageController, count: 6,),
        )
      ],
    );
  }
}
