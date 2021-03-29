import 'internationalization.dart';

Internationalization language;

String twoDigitInt(int number) {
    if (number < 10)
        return "0" + number.toString();
    else
        return number.toString();
}

String dateToString(DateTime time) {
    String string = "";
    if (time.difference(DateTime.now()).inHours < 24)
        string += language.getToday();
    else if (time.difference(DateTime.now()).inHours < 48)
        string += language.getTomorrow();
    else
        string += twoDigitInt(time.day) + "-" + twoDigitInt(time.month) + "-" + twoDigitInt(time.year);

    string += " à " + twoDigitInt(time.hour) + ":" + twoDigitInt(time.minute);

    return string;
}