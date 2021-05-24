import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

import '../CalendarEvent.dart';

abstract class Calendar {

  List<CalendarEvent> appointments;

  Calendar() {
    appointments = <CalendarEvent>[];
  }

  /// Gestion des fichiers
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

   Future<File> get localFile;

  Future<void> readEvents() async {
    try {
      File file = await localFile;

      if (file.existsSync()) {

        // Read the file
        List<String> contents = file.readAsLinesSync();
        for (String line in contents) {
          Map<String, dynamic> eventMap = jsonDecode(line);
          CalendarEvent event = CalendarEvent.fromJson(eventMap);
          addEvent(event);
        }
      }
    } catch (e) {
      print("ERROR OCCURED WHILE READING : " + e.toString());
    }
  }

  void writeEvents() async {
    try {
      final file = await localFile;

      file.writeAsStringSync("", mode: FileMode.write);
      for (CalendarEvent event in appointments) {
        file.writeAsStringSync(event.toJson().toString() + "\n", mode: FileMode.append);
      }
    } catch (e) {
      print("ERROR OCCURED WHILE WRITING : " + e);
    }
  }
  /// Fin de Gestion des fichiers

  List<CalendarEvent> getEvents() { return appointments; }

  /// if the index send is too high, getEvent return null value
  CalendarEvent getEvent(int index) { return isIndexInRange(index) ? appointments.elementAt(index) : null; }

  bool isIndexInRange(int index) { return index < appointments.asMap().length && index >= 0; }

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
      appointments.sort((event1, event2) {
        return event1.getStartTime().compareTo(event2.getStartTime());
      });
  }

  ///return -1 if there is no event before this date
  /// we compare to the end of the end if he is during many days
  int getFirstEventIdFrom(DateTime date) {
    int id = 0;

    for (CalendarEvent event in appointments) {
      if (event.getOccurrence().isNull() || (event.getOccurrence().year == 0 && event.getOccurrence().month == 0 && event.getOccurrence().day == 0 && event.getRepetition() == 0)) {
        if (date.year < event.getEndTime().year)
          return id;
        else if (date.year == event.getEndTime().year){
          if (date.month < event.getEndTime().month)
            return id;
          else if (date.month == event.getEndTime().month) {
            if (date.day <= event.getEndTime().day) {
              return id;
            }
          }
        }
      }
      else
      {
        DateTime tmp;
        for (int i = 0; i < event.getRepetition(); i++)
        {
          tmp = DateTime(date.year - event.getOccurrence().year * i, date.month - event.getOccurrence().month * i, date.day - event.getOccurrence().day * i);
          if (tmp.year < event.getEndTime().year) {
            if (tmp.isBefore(appointments[id+1].getStartTime()))
              return id;
            else
              i = event.getRepetition();  /// Stoping for loop because it became useless to continue
          }
          else if (tmp.year == event.getEndTime().year){
            if (tmp.month < event.getEndTime().month) {
              if (tmp.isBefore(appointments[id+1].getStartTime()))
                return id;
              else
                i = event.getRepetition();  /// Stoping for loop because it became useless to continue
            }
            else if (tmp.month == event.getEndTime().month) {
              if (tmp.day <= event.getEndTime().day) {
                return id;
              }
            }
          }
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