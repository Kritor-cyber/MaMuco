import 'internationalization.dart';
import 'utilities.dart';

class CalendarEvent {
  static Internationalization language;

  DateTime startTime = null, endTime = null;
  String title;
  String infos;
  DateTime occurrence;  //Describe the time elapsed between two repetition of the event (if it's value equals 0 seconds, there is no repetition)
  int numberRepetition; //Contain the number of times the event is repeat (useless value if no repetition, infinite repetition if it's value equals zero)

  static void setLanguage(Internationalization lang) { language = lang; }

  DateTime getStartTime() { return startTime; }
  DateTime getEndTime() { return endTime; }
  String getTitle() { return title; }
  String getInfos() { return infos; }
  DateTime getOccurrence() { return occurrence; }
  int getRepetition() { return numberRepetition; }

  /**
   * return FALSE if the new start time isn't before the actual end time
   */
  bool setStartTime(DateTime time) {
    if (endTime == null)
      startTime = time;
    else if (time.isBefore(endTime))
      startTime = time;
    else
      return false;

    return true;
  }

  /**
   * return FALSE if the new end time isn't after the actual start time
   */
  bool setEndTime(DateTime time) {
    if (startTime == null)
      endTime = time;
    else if (time.isAfter(startTime))
      endTime = time;
    else
      return false;

    return true;
  }

  /**
   * return FALSE if the new end time isn't after the new start time
   */
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
  void setOccurrence(DateTime time) { occurrence = time; }
  void setRepetition(int repetition) { numberRepetition = repetition; }

  String getStartTimeString() { return dateToString(startTime); }

  String getEndTimeString() { return dateToString(endTime); }
}