
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/core/styles/app_colors.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, this.rating,  this.ratingFunction, this.ratingColor, this.ignoreTouch, this.size});
  final double ? rating;
  final Function (double rating ) ? ratingFunction;
  final Color ? ratingColor;
  final bool ? ignoreTouch;
  final double ?size;

  @override
  Widget build(BuildContext context) {
    return  RatingBar(
      initialRating: rating??0,
      tapOnlyMode: true,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures:ignoreTouch??false ,
      itemCount:rating !>5&&rating!=null? rating!.ceil():5,
      ratingWidget: RatingWidget(
          full:  Icon(Icons.star_rounded,
            color:ratingColor?? basicColor,),
          half:  Icon(Icons.star_half_rounded,
            color:ratingColor?? basicColor,),
          empty:  Icon(IconlyBold.star,
              color:ratingColor?.withOpacity(0.2)??  basicColor.withOpacity(0.2))
      ) ,
      itemSize:size??30,

      onRatingUpdate: ratingFunction??(rate){},
    );
  }
}
