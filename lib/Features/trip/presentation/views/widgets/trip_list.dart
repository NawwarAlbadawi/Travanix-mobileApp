

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/trip/presentation/views/widgets/trip_item.dart';
import 'package:travanix/Features/trip/presentation/views_model/cubits/get_trips_cubit/get_trips_cubit.dart';
import 'package:travanix/core/widgets/error_state_text.dart';

class TripList extends StatelessWidget {
  const TripList({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<GetTripsCubit,GetTripsState>(
      builder: (context,state) {
        if(state is GetTripsLoading)
          {
            return const  Center(child: CircularProgressIndicator(),);
          }
        else if(state is GetTripsFails)
          {
            return ErrorStateText(text:state.error );
          }
        var cubit=GetTripsCubit.get(context);
        return CarouselSlider.builder(
          itemCount: cubit.model!.data!.length,
          itemBuilder:(context,index,s)=>Padding(
            padding: const EdgeInsets.only(right: 0),
            child: TripItem(model: cubit.model!.data![index],),
          ),
          disableGesture: false,
          options: CarouselOptions(
            aspectRatio: 1,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            padEnds: false,
            scrollPhysics:const  BouncingScrollPhysics()




          ) ,


        );
      }
    );
  }
}
// ListView.builder(
// itemBuilder:(context,index)=> Padding(
// padding:const EdgeInsets.symmetric(horizontal: 10.0),
// child:  TripItem(model: cubit.model!.data![0],),
// ),
// itemCount: 5,
// scrollDirection: Axis.horizontal,
// )