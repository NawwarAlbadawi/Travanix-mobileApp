import 'package:flutter/material.dart';

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
        itemBuilder: (context,index)=> ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          child: AspectRatio(
            aspectRatio: 16/9,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.hue),
                    fit: BoxFit.fill,
                    image:  NetworkImage('http://$ip:8001 ${images[index]}',),
                  )
              ),

            ),
          ),
        ),
        itemCount: images.length,),
    );
  }
}
