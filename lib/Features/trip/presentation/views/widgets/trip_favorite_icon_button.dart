import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/Features/trip/presentation/views_model/cubits/get_trips_cubit/get_trips_cubit.dart';
import 'package:travanix/core/styles/app_colors.dart';
class TripFavoriteIconButton extends StatelessWidget {
  const TripFavoriteIconButton({super.key, required this.id});
 final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTripsCubit,GetTripsState>(
        builder: (context,state) {
          var cubit=GetTripsCubit.get(context);


          return  IconButton(
            color: cubit.favorite[id]!?Colors.red:greyColor,
            icon:  Icon(IconlyBold.heart,
              size:MediaQuery.sizeOf(context).width*.075,

            ),
            onPressed: (){
              cubit.changeTripFavoriteState(id);
            },
          );
        }
    );
  }
}
