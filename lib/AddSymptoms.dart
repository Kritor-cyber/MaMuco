import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utilities.dart';

class AddSymptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language.getAddSymptoms()),
      ),
        body: Container(
        //margin: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getSymptomsButton(context, Text("Respiration"), MaterialPageRoute(builder: (context) => AddSymptoms())),
                getSymptomsButton(context, Text("Digestion"), MaterialPageRoute(builder: (context) => AddSymptoms())),
                getSymptomsButton(context, Text("Humeur"), MaterialPageRoute(builder: (context) => AddSymptoms())),
                getSymptomsButton(context, Text("Autres symptomes"), MaterialPageRoute(builder: (context) => AddSymptoms()))

                ]
            ),
          ),
    );
  }
  ElevatedButton getSymptomsButton (BuildContext context, Text title, MaterialPageRoute route) {
    return ElevatedButton(
      onPressed:(){
      Navigator.push(context, route);
    },
    style : ButtonStyle (
    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    ),
    child: title,
    );
  }
}