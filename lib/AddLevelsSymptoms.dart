import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ma_muco/CalendarEvent.dart';
import 'package:ma_muco/Calendars/Calendar.dart';

abstract class AddLevelsSymptoms extends StatelessWidget {
  Calendar calendar;
  AddLevelsSymptoms (Calendar calendar){this.calendar=calendar;}
  Widget build(BuildContext context) {
    Form zoneTexte = getInputText(context);
    List<String> proposition;
    List<Color> color;
    List<String> subtitle;
    List<String> images;
    if (zoneTexte == null) {
      proposition = getListLevels();
      color = getListColors();
      subtitle = getListSubtitles();
      images = getListImages();
    }

    return Container(
      padding: EdgeInsets.all(25),
      color: Colors.white,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  child: Text("Choississez le symptôme à ajouter :"),
                  margin: EdgeInsets.only(bottom: 10),
                ),
                Container(
                  child: ListView(
                    shrinkWrap: true,
                    children: zoneTexte == null
                        ? getListZones(proposition, color, subtitle, images, context)
                        : [zoneTexte],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> getListLevels() {
    return [("erreur")];
  }

  List<Color> getListColors() {
    return [Colors.purple];
  }

  List<String> getListSubtitles() {
    return ["erreur"];
  }

  List<String> getListImages() {
    return ["assets/cross.png"];
  }

  Form getInputText(BuildContext context) {
    return null;
  }

  String getSymptomTitle () ;

  Widget getListZone(Text title, Color color, Text subtitle, Image asset, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: ElevatedButton(
        style: ButtonStyle(
         backgroundColor: MaterialStateProperty.resolveWith((states)  {return color;})
          ),
          onPressed: () async{
            var duration = await showTimePicker(context: context, initialTime: TimeOfDay(hour: 0, minute: 5), helpText: "sélectionner la durée du symptome");
            if(duration!=null) {
              CalendarEvent newEvent = CalendarEvent();
              newEvent.setTitle(getSymptomTitle());
              newEvent.setInfos(title.data);
              newEvent.setTimes(DateTime.now(),DateTime.now().add(Duration(hours: duration.hour, minutes: duration.minute)));
              newEvent.setRepetition(0);
              print(getSymptomTitle()+"/" + title.data);
              calendar.addEvent(newEvent);
              calendar.writeEvents();
            }
            else {
              print("Evenement non ajouté aucune durée ajoutée");
            }
          },
          child: Row(
            children: [
              asset,
              Column(
                children: [
                  title,
                  subtitle,
                ],
              )
            ],
          )),
    );

  }

  List<Widget> getListZones(List<String> proposition, List<Color> colors,
      List<String> subtitles, List<String> images, BuildContext context) {
    List<Widget> propositions = [];
    for (int i = 0; i < proposition.asMap().length; i++) {
      propositions.add(getListZone(
          Text(proposition[i],style: TextStyle(color: Colors.black)),
          colors[i],
          Text(subtitles[i],style: TextStyle(color: Colors.black)),
          Image(
              image: AssetImage(images[i]),
              fit: BoxFit.fitHeight,
              height: 50), context));
    }
    return propositions;
  }
}

class AddLevelsSymptomsRespiration extends AddLevelsSymptoms {
  AddLevelsSymptomsRespiration(Calendar calendar) : super(calendar);
  String getSymptomTitle () {return ("Respiration");}
  List<String> getListLevels() {
    return [
      ("Bonne"),
      ("Moyenne"),
      ("Mauvaise"),
      ("Details"),
    ];
  }

  List<Color> getListColors() {
    return [Colors.red, Colors.blue, Colors.green, Colors.yellow];
  }

  List<String> getListSubtitles() {
    return ["sous-titre1", "sous-titre2", "sous-titre3", "sous-titre4"];
  }

  List<String> getListImages() {
    return [
      "assets/lung.png",
      "assets/heart.png",
      "assets/medic.png",
      "assets/sick_boy.png"
    ];
  }
}

class AddLevelsSymptomsDigestion extends AddLevelsSymptoms {
  AddLevelsSymptomsDigestion(Calendar calendar) : super(calendar);
  String getSymptomTitle () {return ("Digestion");}
  List<String> getListLevels() {
    return [
      ("Bonne"),
      ("Moyenne"),
      ("Mauvaise"),
      ("Details"),
    ];
  }

  List<Color> getListColors() {
    return [Colors.blue, Colors.green, Colors.red, Colors.yellow];
  }

  List<String> getListSubtitles() {
    return ["sous-titre1", "sous-titre2", "sous-titre3", "sous-titre4"];
  }

  List<String> getListImages() {
    return [
      "assets/lung.png",
      "assets/heart.png",
      "assets/medic.png",
      "assets/sick_boy.png"
    ];
  }
}

class AddLevelsSymptomsMood extends AddLevelsSymptoms {
  AddLevelsSymptomsMood(Calendar calendar) : super(calendar);
  String getSymptomTitle () {return ("Humeur");}
  List<String> getListLevels() {
    return [
      ("Heureux"),
      ("Fatigué"),
      ("Triste"),
      ("Stressé"),
    ];
  }

  List<Color> getListColors() {
    return [Colors.yellow, Colors.blue, Colors.green, Colors.red];
  }

  List<String> getListSubtitles() {
    return ["sous-titre1", "sous-titre2", "sous-titre3", "sous-titre4"];
  }

  List<String> getListImages() {
    return [
      "assets/lung.png",
      "assets/heart.png",
      "assets/medic.png",
      "assets/sick_boy.png"
    ];
  }
}

class AddLevelsSymptomsOther extends AddLevelsSymptoms {
  AddLevelsSymptomsOther(Calendar calendar) : super(calendar);
  String getSymptomTitle () {return ("Autre");}
  Form getInputText(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String textEntree = "";
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(validator: (value) {
            if (value == null || value.length < 1) {
              return ("Saisie vide");
            }
            textEntree = value;
            return null;
          }),
          ElevatedButton(
              onPressed: () async{
                if (formKey.currentState.validate()) {
                  print("valeur entrée " + textEntree);
                  var duration = await showTimePicker(context: context,
                      initialTime: TimeOfDay(hour: 0, minute: 5),
                      helpText: "sélectionner la durée du symptome");
                  if (duration != null) {
                    CalendarEvent newEvent = CalendarEvent();
                    newEvent.setTitle(getSymptomTitle());
                    newEvent.setInfos(textEntree);
                    newEvent.setTimes(DateTime.now(), DateTime.now().add(
                        Duration(
                            hours: duration.hour, minutes: duration.minute)));
                    newEvent.setRepetition(0);
                    print(getSymptomTitle() + "/" + textEntree);
                    calendar.addEvent(newEvent);
                    calendar.writeEvents();
                  }
                }
              },
              child: Text("valider")),
        ],
      ),
    );
  }
}
