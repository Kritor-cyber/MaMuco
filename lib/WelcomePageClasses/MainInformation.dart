import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../CalendarEvent.dart';
import '../utilities.dart';

class MainInformation {
  List<CalendarEvent> events;

  MainInformation() {
    events = null;
  }
  MainInformation.Events(this.events);

  List<CalendarEvent> getEvents() {
    return events;
  }

  void setEvents(List<CalendarEvent> newEvents) {
    events = newEvents;
  }

  Widget getWidget() {
    if (events == null) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightGreen[200], Colors.lightGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(

          language.getNoIncomingEvent(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    List<Widget> list = <Widget>[];

    for (CalendarEvent event in events) {
      Container container = Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightGreen[200], Colors.lightGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                // Title configuration
                event.getTitle(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.only(bottom: 5),
            ),
            Container(
              width: double.infinity,
              child: Text(
                // Date configuration
                event.getStartTimeString() +
                    " " +
                    language.getTo() +
                    " " +
                    event.getEndTimeString(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                // Informations configuration
                event.getInfos(),
                textAlign: TextAlign.left,
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
