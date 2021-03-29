import 'package:flutter/material.dart';
import 'package:ma_muco/utilities.dart';

import 'CalendarEvent.dart';
import 'WelcomePageClasses/MainInformation.dart';

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

    return Scaffold(
        appBar: AppBar(
          title: Text(language.getAppName()),
        ),
        body: Column(
          children: [
              Column(
                children: [
                  info.getWidget(),
                  info2.getWidget(),
                ]
              ),
              getAddingBar(),
              getFastAccessBar(),
            ],
          ),
        );

    /*return Column(
        children: [
            Column(
                children: [
                  info.getWidget(),
                  info2.getWidget(),
                ]
            ),
            getAddingBar(),
          Positioned(child: getFastAccessBar(), bottom: 0,),
        ]
    );*/
  }

  Widget getAddingBar() {
    return Container (
      color: Colors.blue,
      child: Row(
        children: [

        ],
      ),
    );
  }

  Widget getFastAccessBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          getAccessButton('assets/calendar-event-fill.png', 'CALENDRIER'),
          getAccessButton('assets/calendar-x-fill.png', 'SYMPTOMES'),
          getAccessButton('assets/calendar2-check-fill.png', 'MEDICAMENTS'),
        ],
      ),
    );
  }

  Widget getAccessButton(String iconName, String text) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 35, right: 35, bottom: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Container(
                //margin: EdgeInsets.only(left: 40, right: 40),
                padding: EdgeInsets.all(10),
                child: Image(
                  image: AssetImage(iconName),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(text),
          ]
        ),
      )
    );
  }
}