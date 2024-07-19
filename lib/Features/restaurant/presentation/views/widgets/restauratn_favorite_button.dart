import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/restaurant/presentation/views_model/cubits/restaurant_cubit.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/widgets/custom_favorite_icon_button.dart';
class RestaurantFavoriteButton extends StatelessWidget {
  const RestaurantFavoriteButton({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<RestaurantCubit,RestaurantState>(
        builder: (context,state){

          var cubit=RestaurantCubit.get(context);


          if(state is GetAllRestaurantLoading)
            {
              return const  CircularProgressIndicator();
            }
      return CustomFavoriteIconButton(onPress:(){

        print(cubit.favorite.length);
        cubit.changeRestaurantFavoriteStatus(id);

      },color:cubit.favorite[id]!?Colors.red:greyColor , );
    }
    );
  }
}
