import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ma_muco/utilities.dart';

import 'Calendar.dart';

class CalendarWidget extends StatefulWidget {

  final Calendar calendar;
  DateTime dateToShow = DateTime.now();

  CalendarWidget(this.calendar);
  _CalendarWidget createState() => _CalendarWidget();
}

class _CalendarWidget extends State<CalendarWidget> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.calendar.getTitle() + " - " + language.getMonthly()),
      ),
      body: Scaffold(
        body: GestureDetector(
          child: Container(
            child: getMonthlyWidget(),
          ),
          onVerticalDragEnd: (details) {

            if (details.velocity.pixelsPerSecond.direction > 0)
              widget.dateToShow = subtractOneMonth(widget.dateToShow);
            else if (details.velocity.pixelsPerSecond.direction < 0)
              widget.dateToShow = addOneMonth(widget.dateToShow);

            print(widget.dateToShow.toString());

            setState(() {

            });
          },
        ),
      ),
    );
  }

  Widget getMonthlyWidget() {
    return Column(
      children: [
        getMonthlyTitle(widget.dateToShow.year, widget.dateToShow.month),
        getDayList(),
        getAllMonthDays(widget.dateToShow.year, widget.dateToShow.month),
        Container(
          height: 150,
        ),
      ],
    );
  }

  Widget getMonthlyTitle(int year, int month) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(10),
      child: Text(
        language.getMonth(month) + " " + year.toString(),
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget getDayList() {
    return Row(
      children: getDayListText(),
    );
  }

  List<Widget> getDayListText() {
    List<Widget> days = [];

    for (int i = 1; i <= 7; i++)
    {
      days.add(Expanded(
        flex: 1,
        child: Text(
          language.getDay(i).substring(0, 3),
          textAlign: TextAlign.center,
        ),
      ));
    }

    return days;
  }

  Widget getAllMonthDays(int year, int month) {
    return Expanded(
        child: Column(
        mainAxisSize: MainAxisSize.max,
        children: getAllWeekDays(year, month),
      ),
    );
  }

  List<Widget> getAllWeekDays(int year, int month) {
    List<Widget> weeks = [];

    DateTime date = DateTime(year, month, 1);
    while (date.weekday > 1)
      date = date.subtract(Duration(days: 1));

    int id = widget.calendar.getFirstEventIdFrom(date);

    int continueMonth = month;
    int previousMonth;
    if (continueMonth == 1)
      previousMonth = 12;
    else
      previousMonth = continueMonth-1;

    while (date.month == continueMonth || date.month == previousMonth) {
      List<Widget> week = [];
      
      for (int i = 0; i < 7; i++) {
        week.add(getDayFromDateTime(date));
        date = date.add(Duration(days: 1));
      }
      weeks.add(Expanded(flex: 1, child: Row(children: week)));
    }

    return weeks;
  }

  Widget getDayFromDateTime(DateTime date) {
    return Expanded(
        flex: 1,
        child: Container(
          //height: double.infinity,
          //color: Colors.orange,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
              width: 1,
              color: Colors.black,
            ),
            color: date.year == DateTime.now().year && date.month == DateTime.now().month && date.day == DateTime.now().day ? Colors.lightBlue : Colors.white,
          ),
          child: Column(
            children: [
              Text(
                date.day.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: date.month != widget.dateToShow.month ? Colors.grey : Colors.black,
                ),
              ),
            ],
          ),
        ),
    );
  }
}