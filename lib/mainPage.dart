
import 'package:flutter/material.dart';
import 'package:ma_muco/utilities.dart';

import 'CalendarEvent.dart';
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
  }

  @override
  Widget build(BuildContext context) {

    return Column(
        children: [
          Column(
              children: [
                info.getWidget(),
                info2.getWidget(),
              ]
          ),
          getAddingBarEvents(context),
          getAddingBarSymptoms(context),
          getAddingBar(),
        ]
    );
  }

  Widget getAddingBar() {
    return Container (
      color: Colors.blue,
      child: Text("Bar d'ajout rapide"),
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
        Navigator.push( context, MaterialPageRoute(builder: (context) => AddEvents()
        ),
        );
      },
      style : ButtonStyle (
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      child: Text(language.getAddEvents()),
    );
  }

}