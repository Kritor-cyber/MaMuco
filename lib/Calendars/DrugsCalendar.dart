import 'package:flutter/material.dart';
import 'dart:io';

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

  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/drug_events.json');
  }
}