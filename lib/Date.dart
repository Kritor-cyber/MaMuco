import 'internationalization.dart';

class Date {
  static Internationalization language;
  int year;
  int month;
  int day;
  int hour;
  int minute;
  int second;

  static void setLanguage(Internationalization newLanguage) {
    language = newLanguage;
  }

  Date.zero() {
    year = 0;    month = 0;    day = 0;    hour = 0;    minute = 0;    second = 0;  }

  Date(this.year, this.month, this.day, this.hour, this.minute, this.second) { }

  int getYear() {
    return year;
  }
  int getMonth() {
    return month;
  }
  String getMonthString() {
    return language.getMonth(day);
  }
  int getDay() {
    return day;
  }
  String getDayString() {
    return language.getDay(day);
  }
  int getHour() {
    return hour;
  }
  int getMinute() {
    return minute;
  }
  int getSecond() {
    return second;
  }

  String toString()
  {
    return getDayString() + " " + day.toString() + " " + getMonthString() + " " + year.toString();
  }
}