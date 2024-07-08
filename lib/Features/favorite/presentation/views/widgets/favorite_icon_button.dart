import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travanix/Features/favorite/presentation/views_model/favorite_cubit.dart';
import 'package:travanix/core/widgets/custom_favorite_icon_button.dart';


class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({super.key, this.id});

  final int ?id;

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FavoriteCubit,FavoriteState>(
        builder: (context,state){
          var cubit=FavoriteCubit.get(context);
          return CustomFavoriteIconButton(

              onPress: (){
                cubit.changeFavoriteStatus(id!);

          }, color: Colors.red,);
        });
  }
}
