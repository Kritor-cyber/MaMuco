
import 'package:flutter/material.dart';
import 'package:ma_muco/Calendars/CalendarWidget.dart';
import 'package:ma_muco/Calendars/DrugsCalendar.dart';
import 'package:ma_muco/Calendars/MeetingsCalendar.dart';
import 'package:ma_muco/Calendars/SymptomsCalendar.dart';
import 'package:ma_muco/WeightGraph.dart';
import 'package:ma_muco/customIcons.dart';
import 'package:ma_muco/utilities.dart';

import 'CalendarEvent.dart';
import 'Calendars/Calendar.dart';
import 'WelcomePageClasses/MainInformation.dart';
import 'AddSymptoms.dart';
import 'AddEvents.dart';

class mainPage extends StatefulWidget {

  MainInformation info;
  MainInformation info2;
  Calendar meetingsCalendar;
  Calendar symptomsCalendar;
  Calendar drugsCalendar;

  /** Events used to test the draw*/
  List<CalendarEvent> list;
  /** END */

  mainPage() {

    /** Events used to test the draw */
    /*list = <CalendarEvent>[];
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
    info2.setEvents(list);*/



    meetingsCalendar = MeetingsCalendar();
    symptomsCalendar = SymptomsCalendar();
    symptomsCalendar.readEvents();
    drugsCalendar = DrugsCalendar();



    /*meetingsCalendar = MeetingsCalendar();
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
    list.last.setStartTime(DateTime(2021, 04, 12, 10, 43));
    list.last.setEndTime(DateTime(2021, 04, 12, 12, 43));
    list.last.setInfos("Symptome 3");
    list.last.setOccurrence(OccurrenceTime(day: 1)); // tous les jours
    list.last.setRepetition(7*4); // pendant 28 jours
    symptomsCalendar = SymptomsCalendar();
    symptomsCalendar.addEvents(list);



    list.clear();
    list.add(CalendarEvent());
    list.last.setTitle("Evenement test Prendre médicament");
    list.last.setStartTime(DateTime(2021, 04, 01, 10, 43));
    list.last.setEndTime(DateTime(2021, 04, 02, 12, 43));
    list.last.setInfos("Prendre 2 comprimés de ... avec un grand verre d'eau avant le repas");
    list.add(CalendarEvent());
    list.last.setTitle("Evenement test Prendre médicament");
    list.last.setStartTime(DateTime(2021, 04, 01, 13, 43));
    list.last.setEndTime(DateTime(2021, 04, 02, 14, 43));
    list.last.setInfos("Prendre 2 comprimés de ... avec un grand verre d'eau avant le repas");
    list.add(CalendarEvent());
    list.last.setTitle("Evenement test Prendre médicament");
    list.last.setStartTime(DateTime(2021, 04, 01, 14, 43));
    list.last.setEndTime(DateTime(2021, 04, 02, 15, 43));
    list.last.setInfos("Prendre 2 comprimés de ... avec un grand verre d'eau avant le repasPrendre 2 comprimés de ... avec un grand verre d'eau avant le repasPrendre 2 comprimés de ... avec un grand verre d'eau avant le repasPrendre 2 comprimés de ... avec un grand verre d'eau avant le repas");
    list.add(CalendarEvent());
    list.last.setTitle("Evenement test Prendre médicament");
    list.last.setStartTime(DateTime(2021, 04, 01, 15, 43));
    list.last.setEndTime(DateTime(2021, 04, 02, 16, 43));
    list.last.setInfos("Prendre 2 comprimés de ... avec un grand verre d'eau avant le repasPrendre 2 comprimés de ... avec un grand verre d'eau avant le repasPrendre 2 comprimés de ... avec un grand verre d'eau avant le repasPrendre 2 comprimés de ... avec un grand verre d'eau avant le repas");
    list.add(CalendarEvent());
    list.last.setTitle("Evenement test Prendre médicament");
    list.last.setStartTime(DateTime(2021, 04, 01, 7, 43));
    list.last.setEndTime(DateTime(2021, 05, 02, 8, 43));
    list.last.setInfos("Prendre 2 comprimés de ... avec un grand verre d'eau avant le repasPrendre 2 comprimés de ... avec un grand verre d'eau avant le repasPrendre 2 comprimés de ... avec un grand verre d'eau avant le repasPrendre 2 comprimés de ... avec un grand verre d'eau avant le repas");
    list.add(CalendarEvent());
    list.last.setTitle("Evenement test Prendre médicament");
    list.last.setStartTime(DateTime(2020, 12, 31, 7, 0));
    list.last.setEndTime(DateTime(2021, 01, 01, 7, 0));
    list.last.setInfos("Prendre 2 comprimés de ... ");
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
    list.last.setInfos("Rendez-vous avec le médecin généraliste pour bilan trimestriel");*/
    /** END */
  }

  @override
  State<StatefulWidget> createState() => _mainPage();
}

class _mainPage extends State<mainPage> {


  ListTile getMenu (BuildContext context, Text title, Image asset, MaterialPageRoute route ) {
    return ListTile(
      title: title,
      leading: asset,
        onTap: () {
          Navigator.push(context, route);
        },
    );
  }
  
  @override
  Widget build(BuildContext context) {

    if (widget.info == null)
    {
      widget.info = MainInformation();
      widget.meetingsCalendar.readEvents().then((value) {
        List<CalendarEvent> list = <CalendarEvent>[];
        int id = widget.meetingsCalendar.getFirstEventIdFrom(DateTime.now());
        if (id != -1) {
          list = <CalendarEvent>[];
          list.add(widget.meetingsCalendar.getEvent(id));
          if (widget.meetingsCalendar.getEvent(id + 1) != null)
            list.add(widget.meetingsCalendar.getEvent(id + 1));

          widget.info.setEvents(list);
          setState(() { });
        }
      });
    }
    if (widget.info2 == null)
    {
      widget.info2 = MainInformation();
      widget.drugsCalendar.readEvents().then((value) {
        List<CalendarEvent> list = <CalendarEvent>[];
        int id = widget.drugsCalendar.getFirstEventIdFrom(DateTime.now());
        if (id != -1) {
          list = <CalendarEvent>[];
          list.add(widget.drugsCalendar.getEvent(id));
          if (widget.drugsCalendar.getEvent(id + 1) != null)
            list.add(widget.drugsCalendar.getEvent(id + 1));

          widget.info2.setEvents(list);
          setState(() { });
        }
      });
      /*


      list.clear();
      id = drugsCalendar.getFirstEventIdFrom(DateTime.now());
      if (id != -1) {
        list = <CalendarEvent>[];
        list.add(drugsCalendar.getEvent(id));
        if (drugsCalendar.getEvent(id + 1) != null)
          list.add(drugsCalendar.getEvent(id + 1));

        info2.setEvents(list);
      }*/
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(language.getAppName()),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            getMenu(context, Text(language.getWeightGraph()), Image(image: AssetImage("assets/graph.png")), MaterialPageRoute(builder: (context) => WeightGraph())),
            getMenu(context, Text(language.getSymptomCalendar()), Image(image: AssetImage("assets/calendar-x-fill.png")), MaterialPageRoute(builder: (context) => CalendarWidget(symptomsCalendar))),
            getMenu(context, Text(language.getDrugsCalendar()), Image(image: AssetImage("assets/calendar-x-fill.png")), MaterialPageRoute(builder: (context) => CalendarWidget(drugsCalendar))),
            getMenu(context, Text(language.getMeetingCalendar()), Image(image: AssetImage("assets/calendar-x-fill.png")), MaterialPageRoute(builder: (context) => CalendarWidget(meetingsCalendar))),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                children: [
                  widget.info == null ? Container() : widget.info.getWidget(),
                  widget.info2 == null ? Container() : widget.info2.getWidget(),
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
          getAccessButton(context, customIcons.calendarFill, language.getCalendarButtonName(), language.getCalendarButtonToolTip(), widget.meetingsCalendar),
          getAccessButton(context, customIcons.calendarXFill, language.getSymptomButtonName(), language.getSymptomButtonToolTip(), widget.symptomsCalendar),
          getAccessButton(context, customIcons.calendarCheckFill, language.getDrugsButtonName(), language.getDrugsButtonToolTip(), widget.drugsCalendar),
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
        Navigator.push( context, MaterialPageRoute(builder: (context) => AddSymptoms(widget.symptomsCalendar)
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddEvents(widget.meetingsCalendar)));
      },
      style : ButtonStyle (
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      child: Text(language.getAddEvents()),
    );
  }
}

