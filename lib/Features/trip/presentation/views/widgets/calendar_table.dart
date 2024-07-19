
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travanix/core/styles/app_colors.dart';
class CalendarTable extends StatelessWidget {
  const CalendarTable({super.key, required this.startDay, required this.endDate});
  final String startDay;
  final String endDate;
  @override
  Widget build(BuildContext context) {


    return  TableCalendar(
      headerVisible: true,

      rowHeight: MediaQuery.sizeOf(context).height*0.06,

      currentDay: DateTime.parse(startDay),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay:DateTime.parse(startDay),
      rangeStartDay: DateTime.parse(startDay),
      rangeEndDay: DateTime.parse(endDate),
      headerStyle:const HeaderStyle(
          titleTextStyle: TextStyle(color: Colors.white),
          formatButtonShowsNext: false,
          formatButtonVisible: false,
          titleCentered: true,
          rightChevronVisible: false,
          leftChevronVisible: false
      ),
      calendarStyle:  CalendarStyle(


          todayDecoration: buildBoxDecoration(),
          rangeHighlightColor: basicColor,
          selectedDecoration: buildBoxDecoration(),
        rangeStartDecoration: buildBoxDecoration(),
        rangeEndDecoration:buildBoxDecoration(),
        withinRangeTextStyle: const TextStyle(
          color: Colors.white
        ),
        defaultTextStyle: TextStyle(
          color: Colors.white
        )




      ),

    );
  }

  BoxDecoration buildBoxDecoration() {
    return const  BoxDecoration(
        color: basicColor,
        shape: BoxShape.circle
    );
  }
}
