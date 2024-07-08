import 'package:custom_indicator/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/restaurant/presentation/views/widgets/restaurant_list_item.dart';
import 'package:travanix/Features/restaurant/presentation/views_model/restaurant_cubit.dart';
class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<RestaurantCubit,RestaurantState>(
      builder: (context,state){
      var cubit= RestaurantCubit.get(context);
      if(state is GetAllRestaurantLoading)
        {
          return const  SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        }
       return SliverList.builder(
          itemBuilder: (context,index)=> Padding(
            padding: const  EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
            child: RestaurantListItem(model: cubit.restaurantModel!.data![index],),
          ),itemCount: cubit.restaurantModel!.data!.length,
       );
    });
  }
}