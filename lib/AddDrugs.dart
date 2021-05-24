import 'package:ma_muco/CalendarEvent.dart';
import 'package:ma_muco/Calendars/DrugsCalendar.dart';
import 'package:ma_muco/Calendars/OccurrenceTime.dart';

import 'utilities.dart';
import 'package:flutter/material.dart';

class AddDrugs extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  String _nameEvent;
  DateTime _date = DateTime.now();
  DateTime _dateEnd = DateTime.now().add(Duration(hours: 1));
  OccurrenceTime _occurrence;
  int _repetition;
  String _details;
  DrugsCalendar _calendar;

  AddDrugs(this._calendar);

  _AddDrugs createState() => _AddDrugs();
}

class _AddDrugs extends State<AddDrugs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language.getAddDrugs()),
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
                      getTextInputZone(language.getNameEvent(), setStrNameEvent, language.getPleaseEnterSomeText()),
                      getDateInputZone(widget._date, setDateRange, language.getDateFormat()),
                      getTextInputZone(language.getOccurrence(), setStrOccurrenceEvent, language.getOccurrenceFormat()),
                      getTextInputZone(language.getDetails(), setStrDetailsEvent, language.getPleaseEnterSomeText()),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith(getButtonColor),
                          shape:
                              MaterialStateProperty.resolveWith(getButtonShape),
                        ),
                        onPressed: () {
                          if (widget._formKey.currentState.validate() && widget._date.isBefore(widget._dateEnd)) {
                            CalendarEvent newEvent = CalendarEvent();
                            newEvent.setTitle(widget._nameEvent);
                            newEvent.setInfos(widget._details);
                            newEvent.setTimes(widget._date, widget._dateEnd);
                            newEvent.setOccurrence(widget._occurrence);
                            newEvent.setRepetition(widget._repetition);
                            widget._calendar.addEvent(newEvent);
                            print("ADD EVENT TO CALENDAR : " + widget._nameEvent + " / " + widget._date.toString() + " / " + widget._details + " / " + widget._occurrence.toString() + " / " + widget._repetition.toString());
                            widget._calendar.writeEvents();
                          }
                        },
                        child: Text(
                          language.getValidate(),
                          style: TextStyle(color: Colors.lightGreen),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container getTextInputZone(String label, Function setValue, String invalidValue) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        validator: (value) {
          if (setValue(value)) return null;
          return invalidValue;
        },
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      ),
    );
  }

  Widget getDateInputZone(DateTime date, Function setValue, String invalidValue) {


    TextEditingController controller = TextEditingController(text: widget._date.day.toString() + " " + language.getMonth(widget._date.month) + " " + widget._date.year.toString() +  " " + language.getAt() + " " + twoDigitInt(widget._date.hour) + ":" +twoDigitInt(widget._date.minute) + " " + language.getTo() + " " + widget._dateEnd.day.toString() + " " + language.getMonth(widget._dateEnd.month) + " " + widget._dateEnd.year.toString() +  " " + language.getAt() + " "  + twoDigitInt(widget._dateEnd.hour) + ":" +twoDigitInt(widget._dateEnd.minute));
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: TextFormField(
        readOnly: true,
        controller: controller,
        decoration: InputDecoration(labelText: "Période de l'évenement", border: OutlineInputBorder()),
        onTap: () async {
          var newDateRange = await showDateRangePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(2100));
          if (newDateRange != null)
          {
            var timeOfStartDay = await showTimePicker(context: context, initialTime: TimeOfDay.now(), helpText: language.getAskStartingTime());
            if (timeOfStartDay != null)
            {
              var timeOfEndDay = await showTimePicker(context: context, initialTime: TimeOfDay.now(), helpText: language.getAskEndingTime());
              if (setValue(newDateRange, timeOfStartDay, timeOfEndDay))
              {
                controller.text = widget._date.day.toString() + " " + language.getMonth(widget._date.month) + " " + widget._date.year.toString() + " " + language.getAt() + " " + twoDigitInt(widget._date.hour) + ":" +twoDigitInt(widget._date.minute) + " " + language.getTo() + " " + widget._dateEnd.day.toString() + " " + language.getMonth(widget._dateEnd.month) + " " + widget._dateEnd.year.toString() +  " " + language.getAt() + " "  + twoDigitInt(widget._dateEnd.hour) + ":" +twoDigitInt(widget._dateEnd.minute);
              }
            }
          }
        }
      )
    );
  }

  bool setStrNameEvent(String name) {
    if (name != null && name.length > 0) {
      widget._nameEvent = name;
      return true;
    }

    return false;
  }

  bool setDateRange(DateTimeRange dateTimeRange, TimeOfDay timeOfStart, TimeOfDay timeOfEnd)
  {
    if (dateTimeRange != null && timeOfStart != null && timeOfEnd != null)
    {
      widget._date = dateTimeRange.start;
      widget._date = widget._date.add(Duration(hours: timeOfStart.hour, minutes: timeOfStart.minute));
      widget._dateEnd = dateTimeRange.end;
      widget._dateEnd = widget._dateEnd.add(Duration(hours: timeOfEnd.hour, minutes: timeOfEnd.minute));
      return true;
    }

    return false;
  }

  bool setStrOccurrenceEvent(String occurrence) {
    if (occurrence == null || occurrence.length == 0) {
      widget._occurrence = OccurrenceTime();
      widget._repetition = 0;
      if (widget._occurrence != null) return true;
    }
    if (occurrence.length > 11) {
      widget._occurrence =
          OccurrenceTime.fromString(occurrence.substring(0, 10));
      widget._repetition =
          int.parse(occurrence.substring(11, occurrence.length));
      if (widget._occurrence != null) return true;
    }

    return false;
  }

  bool setStrDetailsEvent(String details) {
    if (details != null && details.length > 0) {
      widget._details = details;
      return true;
    }

    return false;
  }

  Color getButtonColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed))
      return Color.fromARGB(255, 150, 150, 150);

    return Color.fromARGB(255, 222, 222, 222);
  }

  OutlinedBorder getButtonShape(Set<MaterialState> states) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );
  }
}
