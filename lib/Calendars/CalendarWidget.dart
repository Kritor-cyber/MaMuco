import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'Calendar.dart';

class CalendarWidget extends StatefulWidget {

  final Calendar calendar;

  CalendarWidget(this.calendar);
  _CalendarWidget createState() => _CalendarWidget();
}

class _CalendarWidget extends State<CalendarWidget> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.calendar.getTitle()),
      ),
      body: Scaffold(
        body: Container(
          child: SfCalendar(
            view: CalendarView.month,
            firstDayOfWeek: 1,
            dataSource: widget.calendar,
          ),
        ),
      ),
    );
  }

}