import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/search/presentation/views_models/search_cubit/search_cubit.dart';

import '../../../../favorite/presentation/views/widgets/custom_container_active_and_inactive.dart';
class SearchCategoriesList extends StatefulWidget {
  const SearchCategoriesList({super.key});

  @override
  State<SearchCategoriesList> createState() => _SearchCategoriesListState();
}

class _SearchCategoriesListState extends State<SearchCategoriesList> {
  List<String>categories=[
    'Trips',
    'Hotels',
    'Restaurants',
    'Tourist'
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchState>(
      builder: (context,state) {
        var cubit=SearchCubit.get(context);
        return SizedBox(
          height: 70,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:categories.length,
              itemBuilder:(context,index)=>GestureDetector(
                onTap: (){
                  cubit.changeCategoryIndex(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomContainer(text: categories[index],
                      isActive:cubit.categoriesIndex==index ),
                ),
              ) ),
        );
      }
    );
  }
}
