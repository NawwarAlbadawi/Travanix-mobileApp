
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travanix/core/styles/app_colors.dart';
class CalendarTable extends StatefulWidget {
  const CalendarTable({super.key});

  @override
  State<CalendarTable> createState() => _CalendarTableState();
}

class _CalendarTableState extends State<CalendarTable> {
  var date=DateTime.now();
  DateTime ? _selectedDay;
  DateTime _focusedDay =DateTime.now();
  @override
  Widget build(BuildContext context) {
    return  TableCalendar(
      rowHeight: MediaQuery.sizeOf(context).height*0.07,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: date,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {

        if(selectedDay.isAfter(date))
        {
          setState(() {

            _selectedDay = selectedDay;

            _focusedDay = focusedDay; // update `_focusedDay` here as well
          });}


      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
      headerStyle:const HeaderStyle(
          formatButtonShowsNext: false,
          formatButtonVisible: false,
          titleCentered: true,
          rightChevronVisible: false,
          leftChevronVisible: false
      ),
      calendarStyle:  CalendarStyle(
          todayDecoration: buildBoxDecoration(),
          rangeHighlightColor: basicColor,
          selectedDecoration: buildBoxDecoration()



      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: basicColor,
        shape: BoxShape.circle
    );
  }
}
