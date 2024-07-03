
import 'package:flutter/material.dart';
import 'package:travanix/Features/restaurant/presentation/views/widgets/restaurant_view_body.dart';
import 'package:travanix/core/widgets/back_row_Icon.dart';


class RestaurantView extends StatelessWidget{
  const RestaurantView({super.key});


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      extendBodyBehindAppBar: true,
      appBar:AppBar(
        leading:const BackRowIcon(),
        backgroundColor:Colors.transparent,
      ) ,
      body: const  RestaurantViewBody(),

    );
  }
}