import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utilities.dart';

class AddSymptoms extends StatefulWidget {
  Widget symptomSelection;
  bool selectingSymptom = false;

  @override
  State<StatefulWidget> createState() => _AddSymptoms();
}

class _AddSymptoms extends State<AddSymptoms> {
  @override
  Widget build(BuildContext context) {
    widget.symptomSelection = GestureDetector(
      onTap: () {
        setState(() {
          widget.selectingSymptom = false;
        });
      },
      child: Container(
        padding: EdgeInsets.all(25),
        color: Color.fromARGB(138, 217, 0, 255),
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
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(language.getAddSymptoms()),
      ),
      body: Container(
        color: Colors.red,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.selectingSymptom = true;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    child: Text("LIST"),
                  ),
                  Text("ICONE de gravite"),
                  Text("VALIDATION"),
                ],
              ),
            ),
            widget.selectingSymptom ? widget.symptomSelection : Container(),
          ],
        ),
      ),
    );
  }

  ListTile getListZone(Text title, Color color, Text subtitle, Image asset) {
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
  }
}
