import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/search/presentation/views_models/search_cubit/search_cubit.dart';
import 'package:travanix/core/widgets/custom_search_bar.dart';

import 'filter.dart';
class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});



  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SearchCubit,SearchState>
      (
        builder:(context,state){
      var cubit=SearchCubit.get(context);
        return CustomSearchBar(
          padding: const EdgeInsets.all(8),
          filterChild: const Filter() ,
          controller: cubit.controller,
          onChange: (value){
            cubit.searchSomeThing();
          },
          applyFunction: (){
            cubit.searchSomeThing();
          },

        );
    });
  }
}
