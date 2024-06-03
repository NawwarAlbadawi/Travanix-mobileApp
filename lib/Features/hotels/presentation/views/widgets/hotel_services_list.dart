import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_colors.dart';
class HotelServicesList extends StatelessWidget {
  const HotelServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.sizeOf(context).height*0.1,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context,index)=> Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 8.0),
            child:  CircleAvatar(
              radius: MediaQuery.sizeOf(context).height*0.035,
              backgroundColor: greyColor,
              foregroundColor: Colors.white,
              child: const Icon(Icons.wifi),
            ),
          )
      ),
    );
  }
}