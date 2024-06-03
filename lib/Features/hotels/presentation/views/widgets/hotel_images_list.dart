import 'package:flutter/material.dart';
import 'package:travanix/generated/assets.dart';
class HotelImagesList extends StatelessWidget {
  const HotelImagesList({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: MediaQuery.sizeOf(context).height*.76,
      child: PageView.builder(
        controller: pageController,
        itemBuilder: (context,index)=> ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          child: Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.hue),

                image: const  AssetImage(
                    Assets.imagesTest,

                ),
               fit:    BoxFit.fill
              )
            ),

          ),
        ),
        itemCount: 3,),
    );
  }
}
