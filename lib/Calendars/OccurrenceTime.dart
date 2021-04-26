import '../utilities.dart';

class OccurrenceTime {
  int year = 0;
  int month = 0;
  int day = 0;

  OccurrenceTime({this.year = 0, this.month = 0, this.day = 0});

  OccurrenceTime.fromString(String data) {
    if (data.length == 10)
    {
      year = int.parse(data.substring(0, 4));
      month = int.parse(data.substring(6, 7));
      day = int.parse(data.substring(9, 10));
    }
    else if (data.length == 14)
    {
      year = int.parse(data.substring(0, 4));
      month = int.parse(data.substring(7, 9));
      day = int.parse(data.substring(12, 14));
    }
  }

  bool isNull()
  {
    return year == 0 && month == 0 && day == 0;
  }

  String toString() {
    String str = "";
    if (year > 999)
      str += year.toString();
    else if (year > 99)
      str += "0" + year.toString();
    else if (year > 9)
      str += "00" + year.toString();
    else
      str += "000" + year.toString();
    return str + " : " + twoDigitInt(month) + " : " + twoDigitInt(day);
  }
}