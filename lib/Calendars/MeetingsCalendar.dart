import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Calendar.dart';

class MeetingCalendar extends Calendar {

  @override
  Widget getWidget() {
    return Container(child: Text("HERE OUR RENDEZ-VOUS CALENDA"));
  }

}