import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'internationalization.dart';

import 'mainPage.dart';
import 'utilities.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  /* English is the default language and then is set to system language if it exists*/
  language = LanguageEn();

  if (Platform.localeName == "fr_FR")
    language = LanguageFr();



  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate/*,
      SfGlobalLocalizations.delegate*/
    ],
    supportedLocales: [
      const Locale('en'),
      const Locale('fr'),
    ],

    title: language.getAppName(),
    theme: ThemeData(
      primaryColor: Colors.green,
    ),
    home: mainPage(),
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}
