

import 'package:flutter/material.dart';
import 'package:travanix/Features/hotels/data/models/hotels_model.dart';

import 'package:travanix/Features/hotels/presentation/views/widgets/hotel_info_body.dart';

import 'package:travanix/constants.dart';


class HotelInfo extends StatelessWidget {
  const HotelInfo({super.key, required this.hotelData});
  final HotelData hotelData;

  @override
  Widget build(BuildContext context) {
    return  DraggableScrollableSheet(
      initialChildSize: 0.36,
      expand: true,
      maxChildSize: 0.8,
        minChildSize: 0.36,


        builder:(context,scroll)=> Container(
              height: MediaQuery.sizeOf(context).height,
              width: double.infinity,
              decoration:   BoxDecoration(
                  color: Colors.white,
                  borderRadius:const  BorderRadius.only(
                    topLeft:Radius.circular(25),
                    topRight: Radius.circular(25),

                  ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: basicRadius,

                  )
                ]

              ),
              child: CustomScrollView(
                controller: scroll,
                slivers:   [
                  SliverToBoxAdapter(
                    child: HotelInfoBody(
                      hotelData: hotelData
                    ),
                  ),


                ],
              ),
            ));
  }
}



