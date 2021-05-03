import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ma_muco/utilities.dart';

class DateSelector extends StatefulWidget {

  Function DateSelectedFunction = null;
  DateTime dateSelected = DateTime.now();

  DateSelector(Function userSelectDate)
  {
    DateSelectedFunction = userSelectDate;
  }
  _DateSelector createState() => _DateSelector();
}

class _DateSelector extends State<DateSelector> {

  @override
  Widget build(BuildContext context) {
    
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(200, 127, 127, 127),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.dateSelected.year.toString() + " - " + language.getMonth(widget.dateSelected.month),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: getAllMonthDays(widget.dateSelected),
                ),
                ElevatedButton(onPressed: () { print(widget.dateSelected); widget.DateSelectedFunction(widget.dateSelected); } , child: Text("Ok")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getAllMonthDays(DateTime dateTime) {

    // Initialisation
    List<Widget> weekWidgets = getDayListTextSmall();
    DateTime time = dateTime;
    while (time.weekday > 1 || (time.month == dateTime.month) && time.day > 1)
      time = time.subtract(Duration(days: 1));

    List<Widget> widgets = [];

    int maxNumberWeek = 0;
    DateTime stopTime = DateTime(dateTime.year, dateTime.month + 1, 1);
    for (int i = 0; i < 7; i++) {
      List<Widget> days = [];
      days.add(weekWidgets.elementAt(i));
      int weekNumber = 0;
      while (time.isBefore(stopTime) || weekNumber < maxNumberWeek) {
        DateTime thisDay = DateTime(time.year, time.month, time.day);
        days.add(
          GestureDetector(
            onTap: () => selectTime(thisDay),
            child: Container(
                color: time.isAtSameMomentAs(widget.dateSelected) ? Colors.blue : Colors.transparent,
                padding: EdgeInsets.all(3),
                child: Text(
                  twoDigitInt(time.day),
                )
            )
          )
        );

        weekNumber++;
        time = time.add(Duration(days: 7));
      }

      if (weekNumber > maxNumberWeek)
        maxNumberWeek = weekNumber;
      time = time.subtract(Duration(days: 7*weekNumber));
      time = time.add(Duration(days: 1));
      widgets.add(Column(children: days, mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center,));
    }

    return widgets;
  }

  void selectTime(DateTime time)
  {
    setState(() {
      widget.dateSelected = time;
    });
  }
}