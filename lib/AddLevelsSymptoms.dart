import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AddLevelsSymptoms extends StatelessWidget {
  Widget build (BuildContext context) {
    List<Text> proposition =getListLevels();
    return Container(
        padding: EdgeInsets.all(25),
        color: Colors.white,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Column(

                children: [
                  Container (
                  child: Text("Choississez le symptôme à ajouter :"),
                  margin : EdgeInsets.only(bottom: 10),
                  ),
                  Container(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        getListZone(proposition[0], Colors.red, Text("Sous titre"), Image(image: AssetImage("assets/lung.png"))),
                        getListZone(proposition[1], Colors.blue, Text("Sous titre"), Image(image: AssetImage("assets/medic.png"))),
                        getListZone(proposition[2], Colors.green, Text("Sous titre"), Image(image: AssetImage("assets/sick_boy.png"))),
                        getListZone(proposition[3], Colors.yellow, Text("Sous titre"), Image(image: AssetImage("assets/heart.png"))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }

  List<Text> getListLevels ();

  ListTile getListZone(Text title, Color color, Text subtitle, Image asset) {
    return ListTile(
      title: title,
      tileColor: color,
      subtitle: subtitle,
      leading: asset,
      /*onTap: () {
        setState(() {
          print("symptome selectionne");
          widget.selectingSymptom = false;
        });
      },*/
    );
  }
}

class AddLevelsSymptomsRespiration extends AddLevelsSymptoms {
  List<Text> getListLevels () {
    return [
    Text("Bonne"),
    Text("Moyenne"),
    Text("Mauvaise"),
    Text("Details"),
    ];
  }
}

class AddLevelsSymptomsDigestion extends AddLevelsSymptoms {
  List<Text> getListLevels () {
    return [
      Text("Bonne"),
      Text("Moyenne"),
      Text("Mauvaise"),
      Text("Details"),
    ];
  }
}

class AddLevelsSymptomsMood extends AddLevelsSymptoms {
  List<Text> getListLevels () {
    return [
      Text("Heureux"),
      Text("Fatigué"),
      Text("Triste"),
      Text("Enervé"),
    ];
  }
}

class AddLevelsSymptomsOther extends AddLevelsSymptoms {
  List<Text> getListLevels () {
    return [
      Text("Ajouter symptome 1"),
      Text("Ajouter symptome 2"),
      Text("Ajouter symptome 3"),
      Text("Details"),
    ];
  }
}