import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/restaurant/presentation/views/widgets/restaurant_list_item.dart';
import 'package:travanix/Features/search/presentation/views_models/search_for_restaurant_cubit/search_for_restaurant_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/error_state_text.dart';
import '../../../../../core/widgets/shimmer_list.dart';
import '../../../../../core/widgets/shimmer_place_holder.dart';
class SearchForRestaurantList extends StatelessWidget {
  const SearchForRestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchForRestaurantCubit,SearchForRestaurantState>(
      builder: (context,state)
      {
        if(state is SearchRestaurantSuccess)
        {
          return   SliverList.builder(

              itemBuilder:(context,index)=>  Padding(
                padding: const  EdgeInsets.symmetric(vertical: 16.0,horizontal: 15),

                child:  RestaurantListItem(model: state.model[index],),
              ) ,

              itemCount: state.model.length);


        }
        else if(state is SearchRestaurantFail)
        {
          return SliverToBoxAdapter(child: ErrorStateText(text: state.error));
        }
        else if (state is SearchRestaurantLoading)
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
