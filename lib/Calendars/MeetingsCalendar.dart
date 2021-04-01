import 'package:flutter/material.dart';

import '../utilities.dart';
import 'Calendar.dart';

class MeetingsCalendar extends Calendar {
  @override
  String getTitle() {
    return language.getCalendarButtonName();
  }

  @override
  Color getColor(int index) {
    return Colors.blue;
  }
}