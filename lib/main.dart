import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'internationalization.dart';

import 'mainPage.dart';
import 'utilities.dart';

void main() {

  // Il y a normalement un moyen de ne pas avoir besoin d'appeler cette fonction : https://flutter.dev/docs/cookbook/persistence/reading-writing-files
  WidgetsFlutterBinding.ensureInitialized();

  /// BUG IF THE FILE DOES NOT EXIST
  //File fichier = File('/data/user/0/fr.benevappli.ma_muco/app_flutter/meeting_events.json');
  /// BUG 1 JANUARY
  //fichier.writeAsStringSync('{"startTime": "2021:04:02:01:01", "endTime": "2021:04:02:10:01", "title": "Mon événement", "infos": "Quelques infos BONUS", "occurrence": "0000:00:00","numberRepetition": "0"}\n{"startTime": "2021:04:03:01:01", "endTime": "2021:04:04:10:01", "title": "Mon événement", "infos": "Quelques infos BONUS", "occurrence": "0000:00:07","numberRepetition": "3"}');

  //debugPaintSizeEnabled = true;
  /* English is the default language but is set to system language if it exists*/
  language = LanguageEn();

  if (Platform.localeName == "fr_FR")
    language = LanguageFr();



  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      SfGlobalLocalizations.delegate
    ],
    supportedLocales: [
      const Locale('en'),
      const Locale('fr'),
    ],

    title: language.getAppName(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: mainPage(),
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}
