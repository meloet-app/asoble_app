import 'package:asoble_app/pages/calender_page.dart';
import 'package:asoble_app/pages/my_home_page.dart';
import 'package:flutter/cupertino.dart';

class SelectIfCalenderModel extends ChangeNotifier{
  int selectedIfCalenderIndex = 0;

  void changeIfCalender(String selectedItem){
    selectedIfCalenderIndex = ifCalenderList.indexWhere((item) => item == selectedItem);

    notifyListeners();
  }
}
