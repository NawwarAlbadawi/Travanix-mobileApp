
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotels_item.dart';
import 'package:travanix/Features/hotels/presentation/views_models/cubits/get_all_hotel_cubit.dart';
import 'package:travanix/core/widgets/error_state_text.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/shimmer_list.dart';
import '../../../../../core/widgets/shimmer_place_holder.dart';



class HotelSList extends StatelessWidget {
  const HotelSList({super.key});

  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<GetAllHotelCubit,GetAllHotelState>(
      builder: (context,state)
      {
        var cubit=GetAllHotelCubit.get(context);

        if(state is GetAllHotelLoading)
          {
            return  ShimmerList(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShimmerPlaceholder(aspectRatio: 2.1, padding:const EdgeInsets.all(8) ,
                    borderRadius: BorderRadius.circular(basicRadius)),
              ),
            );
          }
        else if(state is GetAllHotelFails)
          {
            return ErrorStateText(text: state.error);
          }
       return   ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder:(context,index)=>  Padding(
                padding: const  EdgeInsets.symmetric(vertical: 16.0,horizontal: 15),
                child:  HotelsItem(hotelsModel: cubit.hotelsModel!,index:index),
              ) ,

              itemCount: cubit.hotelsModel!.data.length);







      },

    );
  }
}