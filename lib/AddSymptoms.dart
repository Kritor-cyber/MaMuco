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
                        ListTile(
                          title: Text("Symptome enregistrer 1"),
                          tileColor: Colors.red,
                          subtitle: Text("sous-titre"),
                          leading: Text("ICONE"),
                          onTap: () {
                            setState(() {
                              print("Symptome 1 selected");
                              widget.selectingSymptom = false;
                            });
                          },
                        ),
                        ListTile(
                          title: Text("Symptome enregistrer 2"),
                          tileColor: Colors.blue,
                          subtitle: Text("sous-titre"),
                          leading: Text("ICONE"),
                          onTap: () {
                            setState(() {
                              print("Symptome 2 selected");
                              widget.selectingSymptom = false;
                            });
                          },
                        ),
                        ListTile(
                          title: Text("Symptome enregistrer 3"),
                          tileColor: Colors.green,
                          subtitle: Text("sous-titre"),
                          leading: Text("ICONE"),
                          onTap: () {
                            setState(() {
                              print("Symptome 3 selected");
                              widget.selectingSymptom = false;
                            });
                          },
                        ),
                        ListTile(
                          title: Text("Ajouter un nouveau symptome à la liste"),
                          tileColor: Colors.yellow,
                          subtitle: Text("sous-titre"),
                          leading: Text("ICONE"),
                          onTap: () {
                            setState(() {
                              print("Add symptom");
                              widget.selectingSymptom = false;
                            });
                          },
                        ),
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
}
