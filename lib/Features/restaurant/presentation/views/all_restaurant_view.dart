
import 'package:flutter/material.dart';
import 'package:travanix/Features/restaurant/presentation/views/widgets/all_restaurants_view_body.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/back_row_Icon.dart';

class AllRestaurantView extends StatelessWidget {
  const AllRestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading:const BackRowIcon(),
        title: Text('Restaurants ',style: AppTextStyles.styleSemiBold24(context).copyWith(

          fontSize: 26
        ),)
      ),
      body:const  AllRestaurantsViewBody(),
    );
  }
}
