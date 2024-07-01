import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/Features/hotels/data/models/hotels_model.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotel_favorite_button.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/rating_bar.dart';
import 'package:travanix/Features/hotels/presentation/views_models/cubits/get_all_hotel_cubit.dart';
import 'package:travanix/constants.dart';
class HotelsItemBar extends StatelessWidget {
  const HotelsItemBar({super.key, required this.hotelsModel, required this.index});

  final HotelsModel hotelsModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(basicRadius),
                color: Colors.white.withOpacity(0.3),
              ),
              padding:const  EdgeInsets.all(8),
              child:  CustomRating(
                color: Colors.yellow,
                rating: hotelsModel.data[index].rating  ,
              )),
          const Spacer(),
           HotelFavoriteButton(
            hotelData: hotelsModel.data[index],
         )
        ],
      ),
    );
  }
}
