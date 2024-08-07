import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/favorite/presentation/views/widgets/favorite_list_item.dart';
import 'package:travanix/Features/favorite/presentation/views_model/favorite_cubit.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/widgets/error_state_text.dart';
import 'package:travanix/core/widgets/shimmer_list.dart';
import 'package:travanix/core/widgets/shimmer_place_holder.dart';
import 'package:travanix/generated/assets.dart';
class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});



  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FavoriteCubit,FavoriteState>(

      builder: (context,state)
      {
        var cubit=FavoriteCubit.get(context);
        if(cubit.favoriteModel==null)
       {
         return   SliverToBoxAdapter (child: ShimmerList(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: ShimmerPlaceholder(aspectRatio: 2.5, padding:const EdgeInsets.all(8) ,
                 borderRadius: BorderRadius.circular(basicRadius)),
           ),
         ),);}

        else if(state is GetFavoriteFail)
          {
            return SliverToBoxAdapter(child: ErrorStateText(text: state.error));

          }


        return cubit.getModel().length==0? SliverToBoxAdapter(child:Image.asset(Assets.imagesEmpty)):
          SliverList.builder(
            itemCount:cubit.getModel().length,
            itemBuilder:(context,index)=> Padding(
              padding: const  EdgeInsets.all( 8.0),
              child:  FavoriteListItem(model: cubit.getModel()[index] ,index: index,),
            ));

      },

    );
  }




}
