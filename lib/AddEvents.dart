import 'package:ma_muco/CalendarEvent.dart';
import 'package:ma_muco/Calendars/MeetingsCalendar.dart';

import 'utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEvents extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  String _nameEvent;
  DateTime _date;
  String _details;
  MeetingsCalendar _calendar;

  AddEvents(this._calendar);

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
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [

                getTextInputZone(language.getNameEvent(), setStrNameEvent, "Please enter some text"),
                getTextInputZone(language.getDate(), setStrDayEvent, "Date format : YYYY:MM:DD:HH:MM"),
                getTextInputZone(language.getDetails(), setStrDetailsEvent, "Please enter some text"),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(getButtonColor),
                    shape: MaterialStateProperty.resolveWith(getButtonShape),
                  ),
                  onPressed: (){
                    if (_formKey.currentState.validate()) {
                      CalendarEvent newEvent = CalendarEvent();
                      newEvent.setTitle(_nameEvent);
                      newEvent.setInfos(_details);
                      newEvent.setTimes(_date, _date.add(Duration(hours: 1)));
                      _calendar.addEvent(newEvent);
                      print("ADD EVENT TO CALENDAR : " + _nameEvent + " / " +
                          _date.toString() + " / " + _details);
                      _calendar.writeEvents();
                    }
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

  Container getTextInputZone(String label, Function setValue, String invalidValue) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        validator: (value) {
          if (value != null && value.isNotEmpty) {
            //print(value);
            if (setValue(value))
              return null;
          }
          return invalidValue;
        },
        //controller: controller,
        decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder()
        ),
      ),
    );
  }

  bool setStrNameEvent(String name) {
    _nameEvent = name;
    return true;
  }

  bool setStrDayEvent(String date) {
    _date = stringToDateTime(date);
    if (_date != null)
      return true;

    return false;
  }

  bool setStrDetailsEvent(String details) {
    _details = details;
    return true;
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