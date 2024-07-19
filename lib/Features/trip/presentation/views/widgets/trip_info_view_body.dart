import 'package:flutter/material.dart';
import 'package:travanix/Features/trip/presentation/views/widgets/trip_details.dart';

import '../../../data/model/TripsModel.dart';
import 'calendar_table.dart';
class TripInfoViewBody extends StatelessWidget {
  const TripInfoViewBody({super.key, required this.model});
  final TripsModelData model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: CalendarTable(startDay: model.tripStartTime!,endDate: model.tripEndTime!,),
        ),
        TripDetails(model: model,)

      ],
    );
  }
}
