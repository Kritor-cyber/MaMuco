import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ma_muco/AddLevelsSymptoms.dart';

import 'utilities.dart';

class AddSymptoms extends StatefulWidget {
  //Widget symptomSelection;
  bool selectingSymptom = false;
  AddLevelsSymptoms addLevelsSymptoms = null;


  @override
  State<StatefulWidget> createState() => _AddSymptoms();
}

class _AddSymptoms extends State<AddSymptoms> {
  @override
  Widget build(BuildContext context) {
   /* widget.symptomSelection = GestureDetector(
      onTap: () {
        setState(() {
          widget.selectingSymptom = false;
        });
      },
      child: Container(
        padding: EdgeInsets.all(25),
        color: Colors.white,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Column(

                children: [
                  Text("Choississez le symptôme à ajouter :"),
                  Container(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        getListZone(Text("Ajouter symptome 1"), Colors.red, Text("Sous titre"), Image(image: AssetImage("assets/lung.png"))),
                        getListZone(Text("Ajouter symptome 2"), Colors.blue, Text("Sous titre"), Image(image: AssetImage("assets/medic.png"))),
                        getListZone(Text("Ajouter symptome 3"), Colors.green, Text("Sous titre"), Image(image: AssetImage("assets/sick_boy.png"))),
                        getListZone(Text("Ajouter un nouveau symptome"), Colors.yellow, Text("Sous titre"), Image(image: AssetImage("assets/heart.png"))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );*/
    return Scaffold(
      appBar: AppBar(
        title: Text(language.getAddSymptoms()),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getSymptomButton("Respiration", () {return AddLevelsSymptomsRespiration();}),
                  getSymptomButton("Digestion",(){return AddLevelsSymptomsDigestion();}),
                  getSymptomButton("Humeur",() {return AddLevelsSymptomsMood();}),
                  getSymptomButton("Autre",() {return AddLevelsSymptomsOther();}),
                ],
              ),
            ),
            widget.selectingSymptom ? widget.addLevelsSymptoms : Container(),
          ],
        ),
      ),
    );
  }

  /*ListTile getListZone(Text title, Color color, Text subtitle, Image asset) {
    return ListTile(
      title: title,
      tileColor: color,
      subtitle: subtitle,
      leading: asset,
      onTap: () {
        setState(() {
          print("symptome selectionne");
          widget.selectingSymptom = false;
        });
      },
    );
  }*/

  TextButton getSymptomButton (String label,Function createAddLevelsSymptoms) {
    return TextButton.icon (
      onPressed: () {
       setState(() {
         widget.addLevelsSymptoms = createAddLevelsSymptoms();
         widget.selectingSymptom = true;
       });
    },
      icon: Icon(Icons.add, size: 30),
      label: Text(label,style: TextStyle(fontSize: 30) ),
      style: TextButton.styleFrom(
        minimumSize: Size(300, 0),
        primary: Colors.blue,
        side: BorderSide(color: Colors.blue, width: 2),
        padding: EdgeInsets.only(top:10, bottom: 10),
    ),
    );
  }
}
