import 'package:flutter/material.dart';
import 'package:travanix/core/widgets/custom_image.dart';

import '../../constants.dart';
class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pageController, required this.images, required this.heightRatio});
  final PageController pageController;
  final double heightRatio;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height*heightRatio,
      child: PageView.builder(
        controller: pageController,
        itemBuilder: (context,index)=> CustomImage(
          image:'http://$ip:8001 ${images[index]}' ,
          clipBorderRadius:const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
          aspectRatio: 1,
        ),
        itemCount: images.length,),
    );
  }
}
