import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/tourist_places/presentation/views/widgets/all_tourist_places_list_item.dart';
import 'package:travanix/Features/tourist_places/presentation/views/widgets/tourist_places_shimmer.dart';
import 'package:travanix/Features/tourist_places/presentation/views_models/get_tourist_places_cubit.dart';
import 'package:travanix/Features/trip/presentation/views_model/cubits/get_trip_places_cubit/get_trip_places_cubit.dart';
import 'package:travanix/core/widgets/error_state_text.dart';
class AllTouristPlacesList extends StatelessWidget {
  const AllTouristPlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTouristPlacesCubit,GetTouristPlacesState>(
      builder: (context,state) {
        var cubit=GetTouristPlacesCubit.get(context);


        if(state is GetTouristPlacesFails)
          {
            return  SliverToBoxAdapter(child: ErrorStateText(text: state.error));
          }
         if(state is GetTouristPlacesLoading)
           {
             return const TouristPlacesShimmer();
           }
        return SliverList.builder(
          itemBuilder:(context,index)=>AllTouristPlacesListItem(model: cubit.model.data[0]) ,
          itemCount: cubit.model.data.length+5,
        );


      }
    );
  }
}
