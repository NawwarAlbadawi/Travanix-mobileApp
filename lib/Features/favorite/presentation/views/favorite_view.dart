
import 'package:flutter/material.dart';

import 'package:travanix/Features/favorite/presentation/views/widgets/custom_container_active_and_inactive.dart';
import 'package:travanix/Features/favorite/presentation/views/widgets/custom_grid.dart';
import 'package:travanix/Features/favorite/presentation/views/widgets/favorite_category_list.dart';

import 'package:travanix/core/styles/app_text_styles.dart';
class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });}

 int itemIndex=0;
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,




              children: [
                Text('Favorite',style: AppTextStyles.styleBold35(context),) ,

                const FavoriteCategoryList()





              ],
            ),
          ),
        ),
        const FavoriteCustomGrid()


      ],

    );
  }
}

