import 'package:flutter/material.dart';

import '../utilities.dart';
import 'Calendar.dart';

class DrugsCalendar extends Calendar {
  @override
  String getTitle() {
    return language.getDrugsButtonName();
  }

  @override
  Color getColor(int index) {
    return Colors.green;
  }
}