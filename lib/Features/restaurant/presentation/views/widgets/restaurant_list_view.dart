import 'package:flutter/material.dart';
import 'package:travanix/Features/restaurant/presentation/views/widgets/restaurant_list_item.dart';
class RestaurantListView extends StatelessWidget {
  const RestaurantListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return const  Padding(
              padding:  EdgeInsets.only(left: 15.0),
              child:  RestaurantListItem(),
            );
          }),
    );
  }
}
