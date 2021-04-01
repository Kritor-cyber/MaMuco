import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../CalendarEvent.dart';

abstract class Calendar extends CalendarDataSource {

  Calendar() {
    appointments = <CalendarEvent>[];
  }

  List<CalendarEvent> getEvents() { return appointments; }

  CalendarEvent getEvent(int index) { return appointments.elementAt(index); }

  void addEvent(CalendarEvent event) {
    if (appointments == null)
      appointments = <CalendarEvent>[];

    appointments.add(event.copy());

    sortEvents();
  }

  void addEvents(List<CalendarEvent> eventsToAdd) {
    if (appointments == null)
      appointments = <CalendarEvent>[];

    appointments.addAll(eventsToAdd);

    sortEvents();
  }

  void removeEvent(CalendarEvent event) {
    if (appointments != null)
      appointments.remove(event);
  }

  void removeEventAt(int id) {
    if (appointments != null)
      appointments.removeAt(id);
  }

  void sortEvents() {
    appointments.sort((event1, event2) { return event1.getStartTime().compareTo(event2.getStartTime()); });
  }

  ///return -1 if there is no event before this date
  int getFirstEventIdFrom(DateTime date) {
    int id = 0;

    for (CalendarEvent event in appointments) {
      if (date.year == event.getStartTime().year) {
        if (date.month == event.getStartTime().month) {
          if (date.day <= event.getStartTime().day)
            return id;
        }
      }

      id++;
    }

    return -1;
  }

  String getTitle();

  String toString() {
    String str = "";
    for (CalendarEvent e in appointments) {
      str += e.getStartTimeString() + " -> " + e.getEndTimeString() + "\n";
    }

    return str;
  }


  @override
  DateTime getStartTime(int index) {
    return appointments[index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].endTime;
  }

  @override
  String getSubject(int index) {
    return appointments[index].title;
  }

  @override
  Color getColor(int index);

  @override
  bool isAllDay(int index) {
    return false;
  }
}