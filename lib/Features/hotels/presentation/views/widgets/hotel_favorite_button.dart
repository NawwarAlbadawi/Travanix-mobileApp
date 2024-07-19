

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/Features/hotels/presentation/views_models/cubits/get_all_hotel_cubit.dart';
import 'package:travanix/constants.dart';

class HotelFavoriteButton extends StatelessWidget {
  const HotelFavoriteButton({super.key, required this.id, this.borderRadius});
  final int id;
  final double ? borderRadius;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllHotelCubit,GetAllHotelState>(
      builder: (context,state) {
       var cubit=GetAllHotelCubit.get(context);
       if(state is GetAllHotelLoading)
         {
           return const Center(child: CircularProgressIndicator(),);
         }

             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(borderRadius??basicRadius),
                     color: Colors.white.withOpacity(0.3),
                   ),

                   child:
                   IconButton(
                     color: cubit.favorite[id]!? Colors.red:Colors.grey,
                     icon: const  Icon(IconlyBold.heart,
                       size: 30,),
                     onPressed: (){
                       cubit.changeHotelFavoriteStatus(id);
                     },
                   )



               ),
             );
      }
    );
  }
}
