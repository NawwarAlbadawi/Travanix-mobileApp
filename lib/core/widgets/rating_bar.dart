
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travanix/core/styles/app_colors.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  RatingBar(
      initialRating: 3,
      tapOnlyMode: true,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ratingWidget: RatingWidget(
          full:const  Icon(Icons.star,

            color: basicColor,),
          half:const  Icon(Icons.star,
            color: basicColor,),
          empty:  Icon(Icons.star,
              color:  basicColor.withOpacity(0.2))
      ) ,
      itemSize: 30,

      onRatingUpdate: (rating) {

      },
    );
  }
}
