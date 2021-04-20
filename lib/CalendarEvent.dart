import 'package:ma_muco/Calendars/OccurrenceTime.dart';

import 'utilities.dart';

class CalendarEvent {

  DateTime startTime = null, endTime = null;
  String title;
  String infos;
  OccurrenceTime occurrence = OccurrenceTime();  //Describe the time elapsed between two repetition of the event (if it's value equals 0 seconds, there is no repetition)
  int numberRepetition = 0; //Contain the number of times the event is repeat (useless value if no repetition, infinite repetition if it's value equals zero)

  CalendarEvent() {}

  /// JSON support
  CalendarEvent.fromJson(Map<String, dynamic> json)
      : startTime = stringToDateTime(json['startTime']),
        endTime = stringToDateTime(json['endTime']),
        title = json['title'],
        infos = json['infos'],
        occurrence = OccurrenceTime.fromString(json['occurrence']),
        numberRepetition = int.parse(json['numberRepetition']);

  Map<String, dynamic> toJson() => {
    '"startTime"': '"' + dateTimeToStringLittle(startTime) + '"',
    '"endTime"': '"' + dateTimeToStringLittle(endTime) + '"',
    '"title"': '"' + title + '"',
    '"infos"': '"' + infos + '"',
    '"occurrence"': '"' + occurrence.toString() + '"',
    '"numberRepetition"': '"' + numberRepetition.toString() + '"',
  };
  /// End JSON support

  DateTime getStartTime() { return startTime; }
  DateTime getEndTime() { return endTime; }
  String getTitle() { return title; }
  String getInfos() { return infos; }
  OccurrenceTime getOccurrence() { return occurrence; }
  int getRepetition() { return numberRepetition; }

  /// return FALSE if the new start time isn't before the actual end time
  bool setStartTime(DateTime time) {
    if (endTime == null)
      startTime = time;
    else if (time.isBefore(endTime))
      startTime = time;
    else
      return false;

    return true;
  }

  ///return FALSE if the new end time isn't after the actual start time
  bool setEndTime(DateTime time) {
    if (startTime == null)
      endTime = time;
    else if (time.isAfter(startTime))
      endTime = time;
    else
      return false;

    return true;
  }

  ///return FALSE if the new end time isn't after the new start time
  bool setTimes(DateTime start, DateTime end) {
    if (start.isBefore(end)) {
      startTime = start;
      endTime = end;
    }
    else
      return false;

    return true;
  }

  void setTitle(String newTitle) { title = newTitle; }
  void setInfos(String newInfos) { infos = newInfos; }
  void setOccurrence(OccurrenceTime time) { occurrence = time; }
  void setRepetition(int repetition) { numberRepetition = repetition; }

  String getStartTimeString() { return dateToString(startTime); }

  String getEndTimeString() { return dateToString(endTime); }

  String getStartHourString() { return hourToString(startTime); }

  String getEndHourString() { return hourToString(endTime); }

  CalendarEvent copy() {
    CalendarEvent copy = CalendarEvent();
    copy.setTimes(startTime, endTime);
    copy.setTitle(title);
    copy.setInfos(infos);
    copy.setOccurrence(occurrence);
    copy.setRepetition(numberRepetition);

    return copy;
  }

  bool isTheSameYear(DateTime time) {

    if (getOccurrence().isNull()) {
      return (time.year >= startTime.year && time.year <= endTime.year);
    }

    bool sameYear = false;
    for (int i = 0; i < getRepetition(); i++) {
      sameYear |= isTheSameYearOccurrence(time, i);
    }

    return sameYear;
  }

  bool isTheSameYearOccurrence(DateTime time, int occurrence) {
    time = DateTime(time.year - getOccurrence().year * occurrence, time.month, time.day);
    return (time.year >= startTime.year && time.year <= endTime.year);
  }

  bool isTheSameMonth(DateTime time) {

    if (getOccurrence().isNull()) {
      return isTheSameYear(time) && (time.month >= startTime.month && time.month <= endTime.month);
    }

    bool sameMonth = false;
    for (int i = 0; i < getRepetition(); i++) {
      sameMonth |= isTheSameMonthOccurrence(time, i);
    }

    return sameMonth;
  }

  bool isTheSameMonthOccurrence(DateTime time, int occurrence) {
    time = DateTime(time.year, time.month - getOccurrence().month * occurrence, time.day);
    return isTheSameYearOccurrence(time, occurrence) && (time.month >= startTime.month && time.month <= endTime.month);
  }

  /* ATTENTION only isTheSameDay really work, the other functions must be updated to take care of event that went on many month/year + occurrence */
  bool isTheSameDay(DateTime time) {

    if (getOccurrence().isNull()) {
      if (time.year != startTime.year || time.year != endTime.year) {
        if (time.year >= startTime.year && time.year <= endTime.year) {
          return true;
        }
        else
          return isTheSameDayOccurrence(time, 0);
      }
      else
      {
        if (time.month != startTime.month || time.month != endTime.month) {
          if (time.month >= startTime.month && time.month <= endTime.month)
            return true;
          else
            return isTheSameDayOccurrence(time, 0);
        }
        else
        {
          if (time.day != startTime.day || time.day != endTime.month) {
            if (time.day >= startTime.day && time.year <= endTime.day)
              return true;
            else
              return isTheSameDayOccurrence(time, 0);
          }
        }
      }
    }

    bool sameDay = false;
    for (int i = 0; i < getRepetition(); i++) {
      sameDay |= isTheSameDayOccurrence(time, i);
    }

    return sameDay;
  }

  bool isTheSameDayOccurrence(DateTime time, int occurrence) {
    time = DateTime(time.year, time.month, time.day - getOccurrence().day * occurrence);
    return isTheSameMonthOccurrence(time, occurrence) && (time.day >= startTime.day && time.day <= endTime.day);
  }
}