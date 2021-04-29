import 'package:ma_muco/CalendarEvent.dart';
import 'package:ma_muco/Calendars/MeetingsCalendar.dart';
import 'package:ma_muco/Calendars/OccurrenceTime.dart';
import 'package:ma_muco/DateSelector.dart';

import 'utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEvents extends StatefulWidget {

  final _formKey = GlobalKey<FormState>();
  String _nameEvent;
  DateTime _date;
  DateTime _dateEnd;
  OccurrenceTime _occurrence;
  int _repetition;
  String _details;
  MeetingsCalendar _calendar;
  bool _selectingData = false;

  AddEvents(this._calendar);

  _AddEvents createState() => _AddEvents();
}

class _AddEvents extends State<AddEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language.getAddEvents()),
      ),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                child: Form(
                  key: widget._formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      getTextInputZone(language.getNameEvent(), setStrNameEvent, language.getPleaseEnterSomeText(), false),
                      getTextInputZone(language.getDate(), setStrDayEvent, language.getDateFormat(), true),
                      getTextInputZone(language.getDateEnd(), setStrDayEndEvent, language.getDateFormat(), true),
                      getTextInputZone(language.getOccurrence(), setStrOccurrenceEvent, language.getOccurrenceFormat(), false),
                      getTextInputZone(language.getDetails(), setStrDetailsEvent, language.getPleaseEnterSomeText(), false),

                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              getButtonColor),
                          shape: MaterialStateProperty.resolveWith(
                              getButtonShape),
                        ),
                        onPressed: () {
                          if (widget._formKey.currentState.validate()) {
                            CalendarEvent newEvent = CalendarEvent();
                            newEvent.setTitle(widget._nameEvent);
                            newEvent.setInfos(widget._details);
                            newEvent.setTimes(widget._date, widget._dateEnd);
                            newEvent.setOccurrence(widget._occurrence);
                            newEvent.setRepetition(widget._repetition);
                            widget._calendar.addEvent(newEvent);
                            //print("ADD EVENT TO CALENDAR : " + _nameEvent + " / " + _date.toString() + " / " + _details + " / " + _occurrence.toString() + " / " + _repetition.toString());
                            widget._calendar.writeEvents();
                          }
                        },
                        child: Text(language.getValidate(),
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Widget to contain a selector
            Visibility(
              child: DateSelector(),
              visible: widget._selectingData,
            ),
          ],
        ),
      ),
    );
  }

  Container getTextInputZone(String label, Function setValue, String invalidValue, bool date) {
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
        onTap: () {
          if (date) {
            setState(() {
              widget._selectingData = true;
            });
          }
        },
      ),
    );
  }

  bool setStrNameEvent(String name) {
    widget._nameEvent = name;
    return true;
  }

  bool setStrDayEvent(String date) {
    widget._date = stringToDateTime(date);
    if (widget._date != null)
      return true;

    return false;
  }

  bool setStrDayEndEvent(String date) {
    widget._dateEnd = stringToDateTime(date);
    if (widget._dateEnd != null)
      return true;

    return false;
  }

  bool setStrOccurrenceEvent(String occurrence) {
    if (occurrence.length > 11) {
      widget._occurrence = OccurrenceTime.fromString(occurrence.substring(0, 10));
      widget._repetition = int.parse(occurrence.substring(11, occurrence.length));
      if (widget._occurrence != null)
        return true;
    }
    else if (occurrence.length == 0) {
      widget._occurrence = OccurrenceTime();
      widget._repetition = 0;
      if (widget._occurrence != null)
        return true;
    }
    return false;
  }

  bool setStrDetailsEvent(String details) {
    widget._details = details;
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