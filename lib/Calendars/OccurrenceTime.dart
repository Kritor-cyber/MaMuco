class OccurrenceTime {
  int year = 0;
  int month = 0;
  int day = 0;

  OccurrenceTime({this.year = 0, this.month = 0, this.day = 0});

  OccurrenceTime.fromString(String data) {
    if (data.length == 10)
    {
      year = int.parse(data.substring(0, 4));
      month = int.parse(data.substring(5, 7));
      day = int.parse(data.substring(8, 10));
    }
  }

  bool isNull()
  {
    return year == 0 && month == 0 && day == 0;
  }

  String toString() {
    return year.toString() + " : " + month.toString() + " : " + day.toString();
  }
}