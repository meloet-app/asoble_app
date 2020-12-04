
import 'package:flutter/cupertino.dart';

class InputAsobleInfoModel extends ChangeNotifier{
  List<int> selectedIndexList = [];

  double freeTimeHeight = 0;
  double freeLocateHeight = 0;
  double freeDisclosureRangeHeight = 0;


  void openInputAsobleDialog(int index){
    selectedIndexList.add(index);
    switch(index){
      case 0: freeTimeHeight = 50;
      break;
      case 1: freeLocateHeight = 50;
      break;
      case 2: freeDisclosureRangeHeight = 50;
      break;
    }
    notifyListeners();
  }

  void closeInputAsobleDialog(int index){
    selectedIndexList.remove(index);
    switch(index){
      case 0: freeTimeHeight = 0;
      break;
      case 1: freeLocateHeight = 0;
      break;
      case 2: freeDisclosureRangeHeight = 0;
      break;
    }
    notifyListeners();
  }

  void clearInputAsobleDialog(){
     freeTimeHeight = 0;
     freeLocateHeight = 0;
     freeDisclosureRangeHeight = 0;
  }

}

