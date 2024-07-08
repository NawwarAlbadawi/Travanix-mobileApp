import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/favorite/presentation/views/widgets/favorite_list_item.dart';
import 'package:travanix/Features/favorite/presentation/views_model/favorite_cubit.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/generated/assets.dart';
class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});



  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FavoriteCubit,FavoriteState>(

      builder: (context,state)
      {
        var cubit=FavoriteCubit.get(context);
        if(cubit.favoriteModel==null){
          return const SliverToBoxAdapter (child: Center(child: CircularProgressIndicator()),);}

        return cubit.getModel().length==0? SliverToBoxAdapter(child:Image.asset(Assets.imagesEmpty)):
          SliverList.separated(
            itemCount:cubit.getModel().length,
            itemBuilder:(context,index)=> Padding(
              padding: const  EdgeInsets.all( 8.0),
              child:  FavoriteListItem(model: cubit.getModel()[index] ,index: index,),
            ) ,
            separatorBuilder:(context,index)=> const Divider(color: greyColor,height: 4,indent: 30,endIndent: 30,thickness: 1.5,));
      },

    );
  }




}
