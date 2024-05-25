

import 'package:flutter/material.dart';
import 'package:travanix/Features/home/presentation/views/widgets/trip_item.dart';

class TripList extends StatelessWidget {
  const TripList({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.sizeOf(context).height*.4,
      child: ListView.builder(itemBuilder:(context,index)=>const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.0),
        child:  TripItem(),
      ),
        itemCount: 20,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}