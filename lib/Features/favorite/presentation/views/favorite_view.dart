
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/favorite/data/repositories/get_favorite_repo.dart';
import 'package:travanix/Features/favorite/data/repositories/post_favorite_repo.dart';
import 'package:travanix/Features/favorite/presentation/views/widgets/favorite_category_list.dart';
import 'package:travanix/Features/favorite/presentation/views/widgets/favorite_list.dart';
import 'package:travanix/Features/favorite/presentation/views_model/favorite_cubit.dart';


import 'package:travanix/core/styles/app_text_styles.dart';
class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>FavoriteCubit(GetFavoriteRepo(), PostFavoriteRepo())..getFavorite(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 10),
                    child: Text('Favorite',style: AppTextStyles.styleBold35(context),
                    ),
                  ) ,
                 const  FavoriteCategoryList()

                ],
              ),
            ),
          ),
        const FavoriteList()
        ],
      ),
    );
  }
}

