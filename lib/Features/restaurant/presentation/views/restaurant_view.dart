
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/restaurant/data/models/restaurant_data.dart';
import 'package:travanix/Features/restaurant/presentation/views/widgets/restaurant_view_body.dart';


class RestaurantView extends StatelessWidget{
  const RestaurantView({super.key, required this.model});
  final RestaurantData model;


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      extendBodyBehindAppBar: true,
      appBar:AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        leading:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.2),
            foregroundColor: Colors.white,
            child: IconButton(
              icon:const  Icon(FontAwesomeIcons.arrowLeft),
              onPressed: (){
                GoRouter.of(context).pop();
              },
            ),
          ),
        ),

      ),
      body:   RestaurantViewBody(model: model),

    );
  }
}