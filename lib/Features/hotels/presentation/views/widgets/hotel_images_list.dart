import 'package:flutter/material.dart';
import 'package:travanix/Features/hotels/data/models/hotels_model.dart';
import 'package:travanix/constants.dart';
class HotelImagesList extends StatelessWidget {
  const HotelImagesList({super.key, required this.pageController, required this.hotelData});

  final PageController pageController;
  final HotelData hotelData;

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: MediaQuery.sizeOf(context).height*.558,
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


                  image:  NetworkImage(''
                      'http://$ip:8001 ${hotelData.images[index]}',



                  ),


                )
              ),

            ),
          ),
        ),
        itemCount: hotelData.images.length,),
    );
  }
}
