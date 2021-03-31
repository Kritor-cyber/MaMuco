
import 'package:flutter/material.dart';
import 'package:ma_muco/Calendars/MeetingsCalendar.dart';
import 'package:ma_muco/customIcons.dart';
import 'package:ma_muco/utilities.dart';

import 'CalendarEvent.dart';
import 'Calendars/Calendar.dart';
import 'WelcomePageClasses/MainInformation.dart';
import 'AddSymptoms.dart';
import 'AddEvents.dart';

class mainPage extends StatelessWidget {

  MainInformation info = MainInformation();
  MainInformation info2 = MainInformation();

  /** Events used to test the draw*/
  List<CalendarEvent> list;
  /** END */

  mainPage() {

    /** Events used to test the draw */
    list = <CalendarEvent>[];
    list.add(CalendarEvent());
    list.last.setTitle("Prendre médicament");
    list.last.setStartTime(DateTime(2021, 03, 29, 10, 43));
    list.last.setEndTime(DateTime(2021, 03, 30, 12, 43));
    list.last.setInfos("Prendre 2 comprimés de ... avec un grand verre d'eau avant le repas");

    list.add(CalendarEvent());
    list.last.setTitle("RDV Médical");
    list.last.setStartTime(DateTime(2021, 03, 31, 13, 00));
    list.last.setEndTime(DateTime(2021, 03, 31, 17, 45));
    list.last.setInfos("Rendez-vous avec le médecin généraliste pour bilan trimestriel");

    info.setEvents(list);
    info2.setEvents(list);
    /** END */

    List<CalendarEvent> list2 = <CalendarEvent>[];
    list2.add(list.elementAt(1));
    list2.add(list.elementAt(0));
    Calendar c = MeetingCalendar();
    c.addEvents(list);
    c.toString();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(language.getAppName()),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Column(
                children: [
                  info.getWidget(),
                  info2.getWidget(),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getAddingBarEvents(context),
                  getAddingBarSymptoms(context),
                ],
              ),
              getFastAccessBar(),
            ],
          ),
        ),
        );
  }

  Widget getFastAccessBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          getAccessButton(customIcons.calendarFill, language.getCalendarButtonName(), language.getCalendarButtonToolTip()),
          getAccessButton(customIcons.calendarXFill, language.getSymptomButtonName(), language.getSymptomButtonToolTip()),
          getAccessButton(customIcons.calendarCheckFill, language.getDrugsButtonName(), language.getDrugsButtonToolTip()),
        ],
      ),
    );
  }

  Widget getAccessButton(IconData icon, String text, String tooltip) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 4),
        child: Column(
          children: [
            IconButton(
              icon: Icon(icon),
              // A lot of colors to test
              color: Colors.red,
              disabledColor: Colors.blueGrey,
              focusColor: Colors.orange,
              highlightColor: Colors.pink,
              hoverColor: Colors.blue,
              splashColor: Colors.green,
              tooltip: tooltip,
              iconSize: 45,
              splashRadius: 40,

              onPressed: () {
                print(text);
              },
            ),
            Text(text),
          ]
        ),
      )
    );
  }
  
  Widget getAddingBarSymptoms (BuildContext context) {
    return ElevatedButton (
      onPressed:() {
        Navigator.push( context, MaterialPageRoute(builder: (context) => AddSymptoms()
        ),
        );
      },
      style : ButtonStyle (
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      child: Text (language.getAddSymptoms()),
    );
  }

  Widget getAddingBarEvents (BuildContext context) {
    return ElevatedButton (
      onPressed:() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddEvents()));
      },
      style : ButtonStyle (
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      child: Text(language.getAddEvents()),
    );
  }
}