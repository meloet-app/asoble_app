


import 'package:asoble_app/pages/my_home_page.dart';
import 'package:flutter/cupertino.dart';

class SelectCommunityModel extends ChangeNotifier{
  int selectedCommunityIndex = 0;

  void changeCommunity(String selectedItem){
    selectedCommunityIndex = CommunityDisplayList.indexWhere((item) => item == selectedItem);

    notifyListeners();
  }
}