import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travanix/Features/trip/presentation/views/widgets/calendar_table.dart';
import 'package:travanix/Features/trip/presentation/views/widgets/trip_steps.dart';
import 'package:travanix/core/styles/app_colors.dart';
class TripViewBody extends StatefulWidget {
  const TripViewBody({super.key});

  @override
  State<TripViewBody> createState() => _TripViewBodyState();
}

class _TripViewBodyState extends State<TripViewBody> {



  @override
  Widget build(BuildContext context) {

    return const SingleChildScrollView(
      child:     Column(

        children: [
          CalendarTable(),
          TripSteps()

        ],
      ),
    );
  }


}
