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

DateTime addOneMonth(DateTime time) {
    int numberOfDays = getNumberOfMonthDays(time);
    return time.add(Duration(days: numberOfDays - time.day + 1));
}

DateTime subtractOneMonth(DateTime time) {
    return time.subtract(Duration(days: time.day));
}

int getNumberOfMonthDays(DateTime month) {
    if (month.month == 1 || month.month == 3 || month.month == 5 || month.month == 7 || month.month == 8 || month.month == 10 || month.month == 12)
        return 31;
    else if (month.month == 4 || month.month == 6 || month.month == 9 || month.month == 11)
        return 30;
    else if (month.month == 2)
        return (month.year % 4 == 0 && month.year % 100 != 0) || (month.year % 400 == 0) ? 29 : 28;
    else
        print("the month " + month.month.toString() + " is invalid");

    return 0;
}