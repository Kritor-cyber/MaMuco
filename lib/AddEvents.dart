import 'utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEvents extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language.getAddEvents()),
      ),
      body: SingleChildScrollView(
        child:Container(
          padding:EdgeInsets.symmetric(vertical:50.0, horizontal: 30.0),
          child: Form(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [

                getTextInputZone(language.getNameEvent()),
                getTextInputZone(language.getDate()),
                getTextInputZone(language.getHour()),
                getTextInputZone(language.getDetails()),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(getButtonColor),
                    shape: MaterialStateProperty.resolveWith(getButtonShape),
                  ),
                  onPressed: (){
                    print("ADD EVENT TO CALENDAR");
                  },
                  child: Text(language.getValidate(),
                    style:TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container getTextInputZone(String label) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder()
        ),
      ),
    );
  }

  Color getButtonColor(Set<MaterialState> states) {

    if (states.contains(MaterialState.pressed))
      return Color.fromARGB(255, 150, 150, 150);

    return Color.fromARGB(255, 222, 222, 222);
  }

  OutlinedBorder getButtonShape(Set<MaterialState> states) {
    return RoundedRectangleBorder (
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );
  }
}