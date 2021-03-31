import 'package:flutter/material.dart';

import '../utilities.dart';
import 'Calendar.dart';

class SymptomsCalendar extends Calendar {
  @override
  String getTitle() {
    return language.getSymptomButtonName();
  }

  @override
  Color getColor(int index) {
    return Colors.red;
  }
}