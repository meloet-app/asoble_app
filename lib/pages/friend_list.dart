import 'package:asoble_app/pages/unique_friend_page/friend_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'friend_item/friend_card.dart';
import 'navigation_bar/navigation_bar.dart';

//===============フレンドページ=====================

class FriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithDropDown(context),
      body: Container(child: Center(child: friendListWidget())),
    );
  }

  //-------------フレンドの繰り返し表示メソッド----------------
  Widget friendListWidget() {

    List<Widget> widgetList = new List<Widget>();//このリストにループで作成したウィジェットをぶち込む

    for (var i = 0; i < list.length; i++) {  //フレンドListの長さ分だけループ、
      widgetList.add(new FriendCard(         //class:フレンドカードをリストに追加
          name: list[i], isFree: freelist[i], userColor: borderColorlist[i]));
    }
    return new ListView(children: widgetList);  //フレンドページに返す
  }
//-------------フレンドの繰り返し表示メソッド　以上----------------

}


//===============フレンドページ 以上=====================





//============テスト=============

List<String> list = [
  "山田太郎",
  "小山仁",
  "土方ポコ太",
  "土方ポコ美",
  "土方ポコ郎",
  "土方ポコ助",
  "土方ポコ子",
  "土方ポコ三郎",
];

List<bool> freelist = [
  true,
  false,
  true,
  true,
  true,
  true,
  true,
  true,
];

List<Color> borderColorlist = [
  Colors.green,
  Colors.blue,
  Colors.orange,
  Colors.orange,
  Colors.orange,
  Colors.orange,
  Colors.orange,
  Colors.orange,
];

//============テスト=============
