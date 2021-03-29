import 'dart:io';
import 'package:flutter/material.dart';
import 'CalendarEvent.dart';
import 'internationalization.dart';

import 'mainPage.dart';
import 'utilities.dart';

void main() {

  //debugPaintSizeEnabled = true;
  /* English is the default language but is set to system language if it exists*/
  language = LanguageEn();

  if (Platform.localeName == "fr_FR")
    language = LanguageFr();

  CalendarEvent.setLanguage(language);

  runApp(MaterialApp(
    title: language.getAppName(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: mainPage(),
  ));
}
