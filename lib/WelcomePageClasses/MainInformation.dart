import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../CalendarEvent.dart';
import '../utilities.dart';

class MainInformation {
  List<CalendarEvent> events;

  MainInformation() { events = null; }
  MainInformation.Events(this.events);

  List<CalendarEvent> getEvents() { return events; }
  void setEvents(List<CalendarEvent> newEvents) { events = newEvents; }

  Widget getWidget() {

    if (events == null) {
      return Container(
        //color: Colors.lightGreen,
        width: double.infinity,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            width: 5,
            color: Colors.blue,
          ),
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Text(language.getNoIncomingEvent(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    List<Widget> list = <Widget>[];

    for (CalendarEvent event in events) {
      Container container = Container(
        //color: Colors.lightGreen,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            width: 5,
            color: Colors.blue,
          ),
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(    // Title configuration
                event.getTitle(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),

              padding: EdgeInsets.only(bottom: 5),
            ),
            Container(
              width: double.infinity,
              child: Text(    // Date configuration
                event.getStartTimeString() + " " + language.getTo() + " " + event.getEndTimeString(),
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(    // Informations configuration
                event.getInfos(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      );

      list.add(container);
    }

    return Column(children: list);
  }
}