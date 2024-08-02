
import 'package:flutter/material.dart';
import 'package:travanix/Features/tourist_places/presentation/views/widgets/all_tourist_places_list.dart';
class AllTouristPlacesViewBody extends StatelessWidget {
  const AllTouristPlacesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [

       AllTouristPlacesList()
      ],
    );
  }
}
