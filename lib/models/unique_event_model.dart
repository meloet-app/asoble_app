
import 'package:flutter/cupertino.dart';

class UniqueEventModel extends ChangeNotifier{
  int selectedIndex = 0;


  void changeUniqueEventPage(int index){
    selectedIndex = index;

    notifyListeners();
  }

  void clearUniqueEventIndex(){
    selectedIndex = 0;
    notifyListeners();
  }
}