import 'internationalization.dart';
import 'utilities.dart';

class CalendarEvent {
  static Internationalization language;

  DateTime startTime, endTime;
  String title;
  String infos;

  static void setLanguage(Internationalization lang) { language = lang; }

  DateTime getStartTime() { return startTime; }
  DateTime getEndTime() { return endTime; }
  String getTitle() { return title; }
  String getInfos() { return infos; }

  void setStartTime(DateTime time) { startTime = time; }
  void setEndTime(DateTime time) { endTime = time; }
  void setTitle(String newTitle) { title = newTitle; }
  void setInfos(String newInfos) { infos = newInfos; }

  String getStartTimeString() {
    return dateToString(startTime);
  }

  String getEndTimeString() {
    return dateToString(endTime);
  }
}