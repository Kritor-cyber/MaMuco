
import 'package:flutter/material.dart';
import 'package:ma_muco/Calendars/CalendarWidget.dart';
import 'package:ma_muco/Calendars/DrugsCalendar.dart';
import 'package:ma_muco/Calendars/MeetingsCalendar.dart';
import 'package:ma_muco/Calendars/SymptomsCalendar.dart';
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
  Calendar meetingsCalendar;
  Calendar symptomsCalendar;
  Calendar drugsCalendar;

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
    list.last.setStartTime(DateTime(2021, 04, 01, 13, 00));
    list.last.setEndTime(DateTime(2021, 04, 01, 17, 45));
    list.last.setInfos("Rendez-vous avec le médecin généraliste pour bilan trimestriel");

    info.setEvents(list);
    info2.setEvents(list);

    List<CalendarEvent> list2 = <CalendarEvent>[];
    list2.add(list.elementAt(1));
    list2.add(list.elementAt(0));
    meetingsCalendar = MeetingsCalendar();
    meetingsCalendar.addEvents(list);


    list.clear();
    list.add(CalendarEvent());
    list.last.setTitle("Evenement test Symptome");
    list.last.setStartTime(DateTime(2021, 03, 31, 10, 43));
    list.last.setEndTime(DateTime(2021, 03, 31, 12, 43));
    list.last.setInfos("Symptome 1");
    list.add(CalendarEvent());
    list.last.setTitle("Evenement test 2 Symptome");
    list.last.setStartTime(DateTime(2021, 04, 01, 10, 43));
    list.last.setEndTime(DateTime(2021, 04, 01, 12, 43));
    list.last.setInfos("Symptome 2");
    list.add(CalendarEvent());
    list.last.setTitle("Evenement test 3 Symptome");
    list.last.setStartTime(DateTime(2021, 04, 03, 10, 43));
    list.last.setEndTime(DateTime(2021, 04, 03, 12, 43));
    list.last.setInfos("Symptome 3");
    symptomsCalendar = SymptomsCalendar();
    symptomsCalendar.addEvents(list);


    list.add(CalendarEvent());
    list.last.setTitle("Evenement test Prendre médicament");
    list.last.setStartTime(DateTime(2021, 04, 01, 10, 43));
    list.last.setEndTime(DateTime(2021, 04, 01, 12, 43));
    list.last.setInfos("Prendre 2 comprimés de ... avec un grand verre d'eau avant le repas");
    drugsCalendar = DrugsCalendar();
    drugsCalendar.addEvents(list);


    list.clear();
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
    /** END */
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
            getFastAccessBar(context),
          ],
        ),
      ),
    );
  }

  Widget getFastAccessBar(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          getAccessButton(context, customIcons.calendarFill, language.getCalendarButtonName(), language.getCalendarButtonToolTip(), meetingsCalendar),
          getAccessButton(context, customIcons.calendarXFill, language.getSymptomButtonName(), language.getSymptomButtonToolTip(), symptomsCalendar),
          getAccessButton(context, customIcons.calendarCheckFill, language.getDrugsButtonName(), language.getDrugsButtonToolTip(), drugsCalendar),
        ],
      ),
    );
  }

  Widget getAccessButton(BuildContext context, IconData icon, String text, String tooltip, Calendar calendar) {
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarWidget(calendar)));
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
        Navigator.push( context, MaterialPageRoute(builder: (context) => AddSymptoms(symptomsCalendar)
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