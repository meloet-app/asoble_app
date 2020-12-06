


import 'package:asoble_app/pages/my_home_page.dart';
import 'package:flutter/cupertino.dart';

class SelectCommunityModel extends ChangeNotifier{
  int selectedCommunityIndex = 0;
  int wkSelectedCommunityIndex =0;

  void changeCommunity(){
    selectedCommunityIndex = wkSelectedCommunityIndex;

    notifyListeners();
  }

  void wkChangeCommunity(int selectedItem){
    wkSelectedCommunityIndex = selectedItem;

    notifyListeners();
  }

  void changeCommunityBackButton(){
    wkSelectedCommunityIndex = selectedCommunityIndex ;

    notifyListeners();
  }

  /*void changeCommunity(String selectedItem){
    selectedCommunityIndex = CommunityDisplayList.indexWhere((item) => item == selectedItem);

    notifyListeners();
  }*/
}