import 'package:flutter/material.dart';
import 'package:travanix/Features/tourist_places/data/models/tourist_places_model_data.dart';
import 'package:travanix/Features/tourist_places/presentation/views/widgets/tourist_place_view_body.dart';
class TouristPlacesView extends StatelessWidget {
  const TouristPlacesView({super.key, required this.model});
  final AttractionActivitiesModelData model;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: TouristPlacesViewBody(model: model,),
    );
  }
}
