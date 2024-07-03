import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/Features/favorite/presentation/views_model/favorite_cubit.dart';

import '../../../../hotels/presentation/views_models/cubits/get_all_hotel_cubit.dart';
class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({super.key, this.id});

  final int ?id;

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FavoriteCubit,FavoriteState>(
        builder: (context,state){
          var cubit=FavoriteCubit.get(context);
          return IconButton(

              onPressed: (){
                cubit.changeFavoriteStatus(id!);
                GetAllHotelCubit.get(context).getAllHotel();
          }, icon:const Icon(IconlyBold.heart,color: Colors.red,));
        });
  }
}
