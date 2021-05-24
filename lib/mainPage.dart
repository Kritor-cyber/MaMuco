import 'package:flutter/material.dart';
import 'package:ma_muco/Calendars/CalendarWidget.dart';
import 'package:ma_muco/Calendars/DrugsCalendar.dart';
import 'package:ma_muco/Calendars/MeetingsCalendar.dart';
import 'package:ma_muco/Calendars/SymptomsCalendar.dart';
import 'package:ma_muco/customIcons.dart';
import 'package:ma_muco/utilities.dart';

import 'AddDrugs.dart';
import 'CalendarEvent.dart';
import 'Calendars/Calendar.dart';
import 'WelcomePageClasses/MainInformation.dart';
import 'AddSymptoms.dart';
import 'AddEvents.dart';
import 'more_infos.dart';

class mainPage extends StatefulWidget {

  MainInformation info;
  MainInformation info2;
  Calendar meetingsCalendar;
  Calendar symptomsCalendar;
  Calendar drugsCalendar;

  mainPage() {

    meetingsCalendar = MeetingsCalendar();
    symptomsCalendar = SymptomsCalendar();
    symptomsCalendar.readEvents();
    drugsCalendar = DrugsCalendar();
  }

  @override
  State<StatefulWidget> createState() => _mainPage();
}

class _mainPage extends State<mainPage> {


  ListTile getMenu(BuildContext context, Text title, IconData asset, Calendar calender, Function(Calendar) AddCreator) {
    return ListTile(
      title: title,
      leading: Icon(asset, color: Colors.green,),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarWidget(calender, AddCreator)));
        },
    );
  }

  ListTile getMenuShort(BuildContext context, Text title, IconData asset, Function() creator) {
    return ListTile(
      title: title,
      leading: Icon(asset, color: Colors.green,),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => creator()));
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
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(language.getAppName()),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            getMenu(context, Text(language.getSymptomCalendar()), customIcons.calendarXFill, widget.symptomsCalendar, addSymptomsFunction),
            getMenu(context, Text(language.getDrugsCalendar()), customIcons.calendarCheckFill, widget.drugsCalendar, addDrugsFunction),
            getMenu(context, Text(language.getMeetingCalendar()), customIcons.calendarFill, widget.meetingsCalendar, addEventsFunction),
            getMenuShort(context, Text("Plus d'infos"), customIcons.calendarFill, addMoreInfosFunction),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, right: 7, left: 7, bottom: 20),
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

  StatefulWidget addEventsFunction(Calendar calendar) {
    return AddEvents(calendar);
  }

  StatefulWidget addSymptomsFunction(Calendar calendar) {
    return AddSymptoms(calendar);
  }

  StatefulWidget addDrugsFunction(Calendar calendar) {
    return AddDrugs(calendar);
  }

  StatelessWidget addMoreInfosFunction() {
    return moreInfos();
  }

  Widget getFastAccessBar(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          getAccessButton(context, customIcons.calendarFill, language.getCalendarButtonName(), language.getCalendarButtonToolTip(), widget.meetingsCalendar, addEventsFunction),
          getAccessButton(context, customIcons.calendarXFill, language.getSymptomButtonName(), language.getSymptomButtonToolTip(), widget.symptomsCalendar, addSymptomsFunction),
          getAccessButton(context, customIcons.calendarCheckFill, language.getDrugsButtonName(), language.getDrugsButtonToolTip(), widget.drugsCalendar, addDrugsFunction),
        ],
      ),
    );
  }

  Widget getAccessButton(BuildContext context, IconData icon, String text, String tooltip, Calendar calendar, Function(Calendar) AddCreator) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.only(bottom: 4),
          child: Column(
              children: [
                IconButton(
                  icon: Icon(icon),
                  color: Colors.green,
                  disabledColor: Colors.blueGrey,
                  focusColor: Colors.orange,
                  highlightColor: Colors.pink,
                  hoverColor: Colors.blue,
                  splashColor: Colors.green,
                  tooltip: tooltip,
                  iconSize: 45,
                  splashRadius: 40,

                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarWidget(calendar, AddCreator)));
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
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green[800]),
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
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green[800]),
      ),
      child: Text(language.getAddEvents()),
    );
  }
}

