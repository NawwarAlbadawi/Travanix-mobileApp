import 'package:flutter/material.dart';

import 'favorite_grid_item.dart';

class FavoriteCustomGrid extends StatelessWidget {
  const FavoriteCustomGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(

      crossAxisCount: 2,
      childAspectRatio: 1/1.6,
      crossAxisSpacing: 5,
      mainAxisSpacing: 15,

      children:List.generate(20, (index)=> const Padding(
        padding:  EdgeInsets.all(8.0),
        child:   FavoriteGridItem(),
      ) ),
    );
  }
}
