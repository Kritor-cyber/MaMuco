import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ma_muco/AddLevelsSymptoms.dart';

import 'Calendars/Calendar.dart';
import 'utilities.dart';

class AddSymptoms extends StatefulWidget {
  Calendar calendar;
  AddSymptoms (this.calendar);
  bool selectingSymptom = false;
  AddLevelsSymptoms addLevelsSymptoms = null;


  @override
  State<StatefulWidget> createState() => _AddSymptoms();
}

class _AddSymptoms extends State<AddSymptoms> {
  @override
  Widget build(BuildContext context) {
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
                  getSymptomButton("Respiration", () {return AddLevelsSymptomsRespiration(widget.calendar);}),
                  getSymptomButton("Digestion",(){return AddLevelsSymptomsDigestion(widget.calendar);}),
                  getSymptomButton("Humeur",() {return AddLevelsSymptomsMood(widget.calendar);}),
                  getSymptomButton("Autre",() {return AddLevelsSymptomsOther(widget.calendar);}),
                ],
              ),
            ),
            widget.selectingSymptom ? widget.addLevelsSymptoms : Container(),
          ],
        ),
      ),
    );
  }

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
        primary: Colors.green,
        side: BorderSide(color: Colors.green, width: 2),
        padding: EdgeInsets.only(top:10, bottom: 10),
    ),
    );
  }
}
