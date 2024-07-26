import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/search/data/Repositories/search_for_hotel_repo.dart';
import 'package:travanix/Features/search/presentation/views/widgets/filter.dart';
import 'package:travanix/Features/search/presentation/views/widgets/hotel_filter.dart';
import 'package:travanix/Features/search/presentation/views/widgets/search_for_hotel_list.dart';
import 'package:travanix/Features/search/presentation/views_models/search_for_hotel_cubit/search_for_hotel_cubit.dart';
import 'package:travanix/core/widgets/custom_search_bar.dart';


class SearchForHotelViewBody extends StatelessWidget {
  const SearchForHotelViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchForHotelCubit,SearchForHotelState>(
      builder:(context,state) {
        var cubit=SearchForHotelCubit.get(context);
       return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              CustomSearchBar(padding:const  EdgeInsets.all(20), filterChild: const  HotelFilter(),
                controller: cubit.controller,
                onChange: (value){
                 cubit.searchSomeThing();
              },
                applyFunction: (){
                cubit.searchSomeThing();
                },
              )
            ],),
          ),
          const SearchForHotelList()
        ],
      );
       },
    );
  }
}
