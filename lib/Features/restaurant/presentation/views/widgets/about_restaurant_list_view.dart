
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travanix/Features/restaurant/data/models/restaurant_data.dart';
import 'package:travanix/Features/restaurant/presentation/views/widgets/about_restaurant_list_item.dart';

import '../../../data/models/restaurant_info_model.dart';
class  AboutRestaurantListView extends StatelessWidget {

   const AboutRestaurantListView({super.key, required this.model});

   final RestaurantData model;



  @override
  Widget build(BuildContext context) {
    final List<RestaurantInfoModel> list= [
      RestaurantInfoModel(title: 'rating', subTitle:model.rating.toString(), icon: FontAwesomeIcons.star),
      RestaurantInfoModel(title: 'Type of food', subTitle:model.typeOfFood, icon: Icons.dining_outlined)
    ];
    return SizedBox(
      height: 85,
      child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return   Padding(
              padding: const   EdgeInsets.only(left: 15.0),
              child:  AboutRestaurantListItem(model: list[index],),
            );
          }),
    );
  }
}
