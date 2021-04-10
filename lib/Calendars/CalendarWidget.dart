import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ma_muco/utilities.dart';

import 'Calendar.dart';

class CalendarWidget extends StatefulWidget {

  final Calendar calendar;
  DateTime dateToShow = DateTime.now();

  PageController _calendarViewer;
  Widget prevMonth, actualMonth, nextMonth;

  double initialOffset = -1;

  CalendarWidget(this.calendar);
  _CalendarWidget createState() => _CalendarWidget();
}

class _CalendarWidget extends State<CalendarWidget> {

  int prevId = 0;
  double position = 0;
  Duration duration = Duration(milliseconds: 1);

  void createMonths() {

    if (widget.actualMonth == null) {

      widget._calendarViewer = PageController(initialPage: 1);
      widget._calendarViewer.addListener(() {
        if (widget.initialOffset == -1)
          widget.initialOffset = widget._calendarViewer.offset;

        if (widget.initialOffset - widget._calendarViewer.offset > 0.75 * widget.initialOffset) {
          widget._calendarViewer.jumpTo(widget.initialOffset+widget._calendarViewer.offset);
          widget.dateToShow = subtractOneMonth(widget.dateToShow);

          widget.nextMonth = widget.actualMonth;
          widget.actualMonth = widget.prevMonth;
          widget.prevMonth = getMonthlyWidget(subtractOneMonth(widget.dateToShow));

          setState(() {});
        }
        else if (widget._calendarViewer.offset - widget.initialOffset > 0.75 * widget.initialOffset) {
          widget._calendarViewer.jumpTo(widget._calendarViewer.offset-widget.initialOffset);
          widget.dateToShow = addOneMonth(widget.dateToShow);

          widget.prevMonth = widget.actualMonth;
          widget.actualMonth = widget.nextMonth;
          widget.nextMonth = getMonthlyWidget(addOneMonth(widget.dateToShow));

          setState(() {});
        }
      });
    }

    widget.prevMonth = getMonthlyWidget(subtractOneMonth(widget.dateToShow));
    widget.actualMonth = getMonthlyWidget(widget.dateToShow);
    widget.nextMonth = getMonthlyWidget(addOneMonth(widget.dateToShow));
  }

  @override
  Widget build(BuildContext context) {

    createMonths();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.calendar.getTitle() + " - " + language.getMonthly()),
      ),
      body: Scaffold(
        body: GestureDetector(
          child: PageView(
            controller: widget._calendarViewer,
            scrollDirection: Axis.vertical,
            children: [
              widget.prevMonth,
              widget.actualMonth,
              widget.nextMonth,
            ],
          ),
        ),
      ),
    );
  }

  Widget getMonthlyWidget(DateTime time) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        getMonthlyTitle(time.year, time.month),
        getDayList(),
        getAllMonthDays(time.year, time.month),
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
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: getAllWeekDays(year, month),
    );
  }

  List<Widget> getAllWeekDays(int year, int month) {
    List<Widget> weeks = [];

    DateTime date = DateTime(year, month, 1);
    while (date.weekday > 1)
      date = date.subtract(Duration(days: 1));

    int id;
    int numberEventThisDay;

    int continueMonth = month;
    int previousMonth;
    if (continueMonth == 1)
      previousMonth = 12;
    else
      previousMonth = continueMonth-1;

    while (date.month == continueMonth || date.month == previousMonth) {
      List<Widget> week = [];

      for (int i = 0; i < 7; i++) {
        numberEventThisDay = 0;
        id = widget.calendar.getFirstEventIdFrom(date);
        while (widget.calendar.isIndexInRange(id) && widget.calendar.getEvent(id).isTheSameDay(date)) {
          numberEventThisDay++;
          id++;
        }
        week.add(getDayFromDateTime(date, continueMonth, numberEventThisDay));
        date = date.add(Duration(days: 1));
      }
      weeks.add(Row(children: week));
    }

    return weeks;
  }

  Widget getDayFromDateTime(DateTime date, int mainMonth, int numberEvent) {

    List<Widget> children = [
      Text(
        date.day.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: date.month != mainMonth ? Colors.grey : Colors.black,
        ),
      ),
    ];

    /// Here is the actual way to represent events in monthly calendar but it will be change
    List<Widget> events = [];
    for (int i = 0; i < numberEvent; i++) {
      events.add(Text("●", style: TextStyle(color: Colors.green),));
    }

    if (numberEvent > 0)
      children.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: events,
      ));

    double size = MediaQuery.of(context).size.width/7;

    Color backgroundColor = Color.fromARGB(0, 0, 0, 0);
    if (isSameDay(date, widget.dateToShow)) {
      backgroundColor = Colors.lightBlue;
    }
    else if (isSameDay(date, DateTime.now()))
      backgroundColor = Colors.lightBlue[100];

    /// This Expanded is to fill the width
    return Expanded(
      flex: 1,
      child: Container(
        width: size,
        height: size,

        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: GestureDetector(
          onTap: () => SelectDate(date),
          child: Container(
            /// Needed to have GestureDetector filling Column
            color: Color.fromARGB(0, 100, 100, 100),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            )
          ),
        ),
      ),
    );
  }

  void SelectDate(DateTime date) {
    setState(() {
      widget.dateToShow = date;
    });
  }
}