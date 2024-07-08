import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travanix/Features/restaurant/presentation/views/widgets/restaurnt_list.dart';
import 'package:travanix/core/widgets/custom_search_bar.dart';

class AllRestaurantsViewBody extends StatelessWidget {
  const AllRestaurantsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers:[
        SliverToBoxAdapter(
          child: CustomSearchBar(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),),
        ),
        RestaurantList()
      ]

    );
  }
}



