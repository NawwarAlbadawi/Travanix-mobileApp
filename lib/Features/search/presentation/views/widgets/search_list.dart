import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/search/presentation/views/widgets/empty_result_image.dart';
import 'package:travanix/Features/search/presentation/views/widgets/search_item.dart';
import 'package:travanix/Features/search/presentation/views_models/search_cubit/search_cubit.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/error_state_text.dart';
import 'package:travanix/generated/assets.dart';
class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  final List<String> routers=[
    AppRouter.tripInfo,
    AppRouter.hotelView,
    AppRouter.restaurantView,
    AppRouter.mapView
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchState>(
      builder :(context,state){
        var cubit=SearchCubit.get(context);
        if(state is SearchFail)
          {
            return SliverToBoxAdapter(child: ErrorStateText(text: state.error));
          }
        else if(state is SearchLoading)
          {
            return const  SliverToBoxAdapter(child:   Center(child: CircularProgressIndicator()));
          }
        return cubit.data[cubit.categoriesIndex].length==0? const EmptyResultImage():
        SliverList.builder(
            itemBuilder:(context,index)=>  Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: GestureDetector(
                onTap: (){ GoRouter.of(context).push(routers[cubit.categoriesIndex],extra: cubit.data[cubit.categoriesIndex][index]);},
                  child: SearchItem(model: cubit.data[cubit.categoriesIndex][index],)),
            ),
        itemCount: cubit.data[cubit.categoriesIndex].length,);
      }
    );

  }
}
