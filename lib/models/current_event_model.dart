


import 'package:asoble_app/pages/my_home_page.dart';
import 'package:flutter/cupertino.dart';

class EventCarouselModel extends ChangeNotifier{
  int selectedEventCarouselIndex = 0;

  void changeEventCarousel(int current){
    selectedEventCarouselIndex = current;

    notifyListeners();
  }
}