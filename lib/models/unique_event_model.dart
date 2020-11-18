
import 'package:flutter/cupertino.dart';

class UniqueEventModel extends ChangeNotifier{
  int selectedIndex;


  void changeUniqueEventPage(int index){
    selectedIndex=index;
    notifyListeners();
  }


}