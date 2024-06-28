import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/favorite/presentation/views_model/favorite_cubit.dart';

import 'custom_container_active_and_inactive.dart';

class FavoriteCategoryList extends StatelessWidget {
  const FavoriteCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit,FavoriteState>(
      builder: (context,state) {
        var cubit=FavoriteCubit.get(context);
        return SizedBox(
          height: MediaQuery.sizeOf(context).height*0.1,
          width: double.infinity,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder:(context,index)=>GestureDetector(
              onTap: (){
                cubit.changeFavoriteCategoryIndex(index);


              },
              child:  Padding(
                padding:const   EdgeInsets.all( 20.0),
                child:  CustomContainer(text: 'Hotel',isActive: cubit.favoriteCategoryIndex ==index,),
              ),
            ),
            itemCount: 3,
          ),

        );
      }
    );
  }
}
