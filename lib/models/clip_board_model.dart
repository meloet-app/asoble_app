

import 'package:asoble_app/pages/friendRequest/add_freind_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetClipBoardModel extends ChangeNotifier{
  var clipStrings="";
  var iconColor=Colors.black;

  void getClipBoardText() async {
    clipStrings = await getFromClipboard() ;
    notifyListeners();
  }




  void clear(){
    clipStrings = "" ;
    notifyListeners();
  }


  getFromClipboard() async {
    Map<String, dynamic> result =
    await SystemChannels.platform.invokeMethod('Clipboard.getData');
    if (result != null) {
      return result['text'].toString();
    }
    return '';
  }

}