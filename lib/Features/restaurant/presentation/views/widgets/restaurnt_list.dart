
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/restaurant/presentation/views/widgets/restaurant_list_item.dart';
import 'package:travanix/Features/restaurant/presentation/views_model/cubits/restaurant_cubit.dart';
import 'package:travanix/generated/assets.dart';
import '../../../../../core/widgets/error_state_text.dart';
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
      else if(state is GetAllRestaurantFails)
        {
          return   SliverToBoxAdapter(child: ErrorStateText(text: state.error,));
        }
       return cubit.restaurantModel!.data!.isEmpty? SliverToBoxAdapter(child: Image.asset(Assets.imagesEmptyItem),) : SliverList.builder(
          itemBuilder: (context,index)=> Padding(
            padding: const  EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
            child: RestaurantListItem(model: cubit.restaurantModel!.data![index],),
          ),itemCount: cubit.restaurantModel!.data!.length,
       );
    });
  }
}

