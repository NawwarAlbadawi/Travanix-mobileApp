import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/Features/hotels/data/models/hotels_model.dart';
import 'package:travanix/Features/hotels/presentation/views_models/cubits/get_all_hotel_cubit.dart';
import 'package:travanix/constants.dart';
class HotelFavoriteButton extends StatelessWidget {
  const HotelFavoriteButton({super.key, required this.hotelData, this.borderRadius});
  final HotelData hotelData;
  final double ? borderRadius;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllHotelCubit,GetAllHotelState>(
      builder: (context,state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius??basicRadius),
            color: Colors.white.withOpacity(0.3),
          ),

          child: IconButton(
            color: GetAllHotelCubit.get(context).favorite[hotelData.id]!? Colors.red:Colors.white,
            icon: const  Icon(IconlyBold.heart,
            size: 30,),
            onPressed: (){
              GetAllHotelCubit.get(context).changeHotelFavoriteStatus(hotelData.id);
            },
          ),
        );
      }
    );
  }
}
