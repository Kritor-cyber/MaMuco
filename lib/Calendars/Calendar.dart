import 'package:flutter/widgets.dart';

import '../CalendarEvent.dart';

abstract class Calendar {
  List<CalendarEvent> events;

  Calendar() {
    events = <CalendarEvent>[];
  }

  List<CalendarEvent> getEvents() { return events; }

  CalendarEvent getEvent(int index) { return events.elementAt(index); }

  void addEvent(CalendarEvent event) {
    if (events == null)
      events = <CalendarEvent>[];

    events.add(event);

    sortEvents();
  }

  void addEvents(List<CalendarEvent> eventsToAdd) {
    if (events == null)
      events = <CalendarEvent>[];

    events.addAll(eventsToAdd);

    sortEvents();
  }

  void removeEvent(CalendarEvent event) {
    if (events != null)
      events.remove(event);
  }

  void removeEventAt(int id) {
    if (events != null)
      events.removeAt(id);
  }

  void sortEvents() {
    events.sort((event1, event2) { return event1.getStartTime().compareTo(event2.getStartTime()); });
  }

  String toString() {
    for (CalendarEvent e in events) {
      print(e.getStartTimeString());
    }
  }

  Widget getWidget();
}