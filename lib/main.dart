import 'dart:io';
import 'package:flutter/material.dart';
import 'internationalization.dart';

void main() {
  /* English is the default language but is set to system language if it exists*/
  Internationalization language = LanguageEn();

  if (Platform.localeName == "fr_FR")
    language = LanguageFr();

  runApp(MaterialApp(
    title: language.getAppName(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MaMucoHomePage(language: language),
  ));
}

class MaMucoHomePage extends StatelessWidget {

  Internationalization language;

  MaMucoHomePage({Key key, @required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(language.getAppName()),
      ),
      body: Center(
        child: Text(
          'Here we will put graphical things.',
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
