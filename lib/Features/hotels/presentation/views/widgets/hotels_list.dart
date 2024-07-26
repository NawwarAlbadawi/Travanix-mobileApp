
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotels_item.dart';
import 'package:travanix/Features/hotels/presentation/views_models/cubits/get_all_hotel_cubit.dart';
import 'package:travanix/core/widgets/error_state_text.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/shimmer_list.dart';
import '../../../../../core/widgets/shimmer_place_holder.dart';



class HotelsList extends StatelessWidget {
  const HotelsList({super.key});

  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<GetAllHotelCubit,GetAllHotelState>(
      builder: (context,state)
      {
        var cubit=GetAllHotelCubit.get(context);

        if(state is GetAllHotelLoading)
          {
            return  SliverToBoxAdapter(
              child: ShimmerList(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShimmerPlaceholder(aspectRatio: 2.1, padding:const EdgeInsets.all(8) ,
                      borderRadius: BorderRadius.circular(basicRadius)),
                ),
              ),
            );
          }
        else if(state is GetAllHotelFails)
          {
            return SliverToBoxAdapter(child: ErrorStateText(text: state.error));
          }
       return   SliverList.builder(
              
              itemBuilder:(context,index)=>  Padding(
                padding: const  EdgeInsets.symmetric(vertical: 16.0,horizontal: 15),
                child:  HotelsItem(hotelModel: cubit.hotelsModel!.data[index]),
              ) ,

              itemCount: cubit.hotelsModel!.data.length);







      },

    );
  }
}