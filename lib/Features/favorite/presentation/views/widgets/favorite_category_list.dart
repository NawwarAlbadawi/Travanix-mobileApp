import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/favorite/presentation/views_model/favorite_cubit.dart';

import '../../../data/models/favourite_category_model.dart';
import 'custom_container_active_and_inactive.dart';

class FavoriteCategoryList extends StatefulWidget {
  const FavoriteCategoryList({super.key});

  @override
  State<FavoriteCategoryList> createState() => _FavoriteCategoryListState();
}

class _FavoriteCategoryListState extends State<FavoriteCategoryList> {

  final List<FavoriteCategoryModel>  list=[
    FavoriteCategoryModel(category: 'Trips'),
    FavoriteCategoryModel(category: 'Hotels'),
    FavoriteCategoryModel(category: 'Restaurants'),
    FavoriteCategoryModel(category:'Tourist destination' )
    
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit,FavoriteState>(
      builder: (context,state) {
        var cubit=FavoriteCubit.get(context);
        return SizedBox(
          height: MediaQuery.sizeOf(context).height*0.1,
          width: double.infinity,

          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder:(context,index)=>GestureDetector(
              onTap: (){
                cubit.changeFavoriteCategoryIndex(index);
                },
              child:  Padding(
                padding:const   EdgeInsets.all( 20.0),
                child:  CustomContainer(text: list[index].category,isActive: cubit.favoriteCategoryIndex ==index,),
              ),
            ),
            itemCount: list.length,
          ),

        );
      }
    );
  }
}
