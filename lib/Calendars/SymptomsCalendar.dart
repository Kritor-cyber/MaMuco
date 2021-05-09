import 'package:flutter/material.dart';
import 'dart:io';

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

  Future<File> get localFile async {
    String path = await localPath;
    return File('$path/symptom_events.json');
  }
}