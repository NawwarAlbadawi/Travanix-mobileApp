import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/error_state_text.dart';
import '../../../../../core/widgets/shimmer_list.dart';
import '../../../../../core/widgets/shimmer_place_holder.dart';
import '../../../../hotels/presentation/views/widgets/hotels_item.dart';
import '../../views_models/search_for_hotel_cubit/search_for_hotel_cubit.dart';
import 'empty_result_image.dart';

class SearchForHotelList extends StatelessWidget {
  const SearchForHotelList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchForHotelCubit,SearchForHotelState>(
      builder: (context,state)
      {

        if(state is SearchHotelSuccess)
        {
          return   SliverList.builder(
              
              itemBuilder:(context,index)=> state.model.isEmpty? const EmptyResultImage():
                  Padding(
                padding: const  EdgeInsets.symmetric(vertical: 16.0,horizontal: 15),

                child:  HotelsItem(hotelModel: state.model[index]),
              ) ,

              itemCount: state.model.length);


        }
        else if(state is SearchHotelFail)
        {
          return SliverToBoxAdapter(child: ErrorStateText(text: state.error));
        }
        else if (state is SearchHotelLoading)
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
        return const  SliverToBoxAdapter(child:   SizedBox());








      },

    );
  }
}
