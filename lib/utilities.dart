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
    if (time.year == DateTime.now().year && time.month == DateTime.now().month && time.day == DateTime.now().day)
        string += language.getToday();
    else if (time.year == DateTime.now().year && time.month == DateTime.now().month && time.day == DateTime.now().day+1)
        string += language.getTomorrow();
    else
        string += twoDigitInt(time.day) + "-" + twoDigitInt(time.month) + "-" + twoDigitInt(time.year);

    string += " à " + twoDigitInt(time.hour) + ":" + twoDigitInt(time.minute);

    return string;
}