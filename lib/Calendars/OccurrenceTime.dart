class OccurrenceTime {
  int year;
  int month;
  int day;

  OccurrenceTime({this.year = 0, this.month = 0, this.day = 0});

  bool isNull()
  {
    return year == 0 && month == 0 && day == 0;
  }

  String toString() {
    return year.toString() + " : " + month.toString() + " : " + day.toString();
  }
}