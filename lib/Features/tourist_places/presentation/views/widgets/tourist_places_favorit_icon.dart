import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/Features/tourist_places/presentation/views_models/get_tourist_places_cubit.dart';
import 'package:travanix/constants.dart';

class TouristPlacesFavoriteIcon extends StatelessWidget {
  const TouristPlacesFavoriteIcon({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTouristPlacesCubit,GetTouristPlacesState>(
        builder: (context,state) {
          var cubit=GetTouristPlacesCubit.get(context);
          if(state is GetTouristPlacesLoading)
          {
            return const Center(child: CircularProgressIndicator(),);
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              color: cubit.favorite[id]!? Colors.grey:Colors.red,
              icon: const  Icon(IconlyBold.heart,
                size: 25,),
              onPressed: (){
                cubit.changeTouristPlacesFavoriteStatus(id);
              },
            ),
          );
        }
    );
  }
}
