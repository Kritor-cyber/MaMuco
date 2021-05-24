import 'package:flutter/material.dart';
import 'dart:io';

import '../utilities.dart';
import 'Calendar.dart';

class MeetingsCalendar extends Calendar {

  @override
  String getTitle() {
    return language.getCalendarButtonName();
  }

  @override
  Color getColor(int index) {
    return Colors.green;
  }

  Future<File> get localFile async {
    String path = await localPath;
    return File('$path/meeting_events.json');
  }
}