import 'package:asoble_app/pages/calendar/calendar_page.dart';
import 'package:asoble_app/pages/my_home_page.dart';
import 'package:flutter/cupertino.dart';

class SelectIfCalenderModel extends ChangeNotifier{
  int selectedIfCalenderIndex = 0;

  void changeIfCalender(String selectedItem){
    selectedIfCalenderIndex = ifCalenderList.indexWhere((item) => item == selectedItem);

    notifyListeners();
  }
}

class CalendarDialogModel extends ChangeNotifier{
  DateTime selectedDay = DateTime.now();

  void onCalendarCellTap(day){

    selectedDay = day;
    print(selectedDay);
    notifyListeners();

}

  void dialogDayForward() {

    selectedDay.add(Duration(days: 1));
    print(selectedDay);
    notifyListeners();

  }

  void dialogDayBack() {

    selectedDay.add(Duration(days:-1));
    print(selectedDay);
    notifyListeners();

  }
}
