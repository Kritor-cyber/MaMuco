import 'package:ma_muco/Calendars/OccurrenceTime.dart';

import 'utilities.dart';

class CalendarEvent {

  DateTime startTime = null, endTime = null;
  String title;
  String infos;
  OccurrenceTime occurrence = OccurrenceTime();  //Describe the time elapsed between two repetition of the event (if it's value equals 0 seconds, there is no repetition)
  int numberRepetition; //Contain the number of times the event is repeat (useless value if no repetition, infinite repetition if it's value equals zero)

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
      return (startTime.year == time.year || endTime.year == time.year);
    }

    bool sameYear = false;
    for (int i = 0; i < getRepetition(); i++) {
      sameYear |= isTheSameYearOccurrence(time, i);
    }

    return sameYear;
  }

  bool isTheSameYearOccurrence(DateTime time, int occurrence) {
    time = DateTime(time.year - getOccurrence().year * occurrence, time.month, time.day);
    return (startTime.year == time.year || endTime.year == time.year);
  }

  bool isTheSameMonth(DateTime time) {

    if (getOccurrence().isNull()) {
      return isTheSameYearOccurrence(time, 0) && (startTime.month == time.month || endTime.month == time.month);
    }

    bool sameMonth = false;
    for (int i = 0; i < getRepetition(); i++) {
      sameMonth |= isTheSameMonthOccurrence(time, i);
    }

    return sameMonth;
  }

  bool isTheSameMonthOccurrence(DateTime time, int occurrence) {
    time = DateTime(time.year, time.month - getOccurrence().month * occurrence, time.day);
    return isTheSameYearOccurrence(time, occurrence) && (startTime.month == time.month || endTime.month == time.month);
  }

  bool isTheSameDay(DateTime time) {

    if (getOccurrence().isNull()) {
      return isTheSameMonthOccurrence(time, 0) && (startTime.day == time.day || endTime.day == time.day);
    }

    bool sameDay = false;
    for (int i = 0; i < getRepetition(); i++) {
      sameDay |= isTheSameDayOccurrence(time, i);
    }

    return sameDay;
  }

  bool isTheSameDayOccurrence(DateTime time, int occurrence) {
    time = DateTime(time.year, time.month, time.day - getOccurrence().day * occurrence);
    return isTheSameMonthOccurrence(time, occurrence) && (startTime.day == time.day || endTime.day == time.day);
  }
}