import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigation_bar/navigation_bar.dart';

class FriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithDropDown(),
      body: Container(child: Center(child: friendListWidget())),
    );
  }

  Widget friendListWidget() {
    List<Widget> widgetList = new List<Widget>();
    for (var i = 0; i < list.length; i++) {
      widgetList.add(new FriendCard(
          name: list[i], isFree: freelist[i], userColor: borderColorlist[i]));
    }
    return new ListView(children: widgetList);
  }
}

class FriendCard extends StatelessWidget {
  String name;
  bool isFree;
  Color userColor;

  FriendCard({this.name, this.isFree, this.userColor});

  Color indicatorColor = const Color(0xff33CC10);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: Card(
          child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    margin:
                        EdgeInsets.only(left: 6, top: 6, right: 12, bottom: 6),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent[100],
                        border: Border.all(color: userColor, width: 2),
                        borderRadius: BorderRadius.circular(60)),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      margin: EdgeInsets.only(top: 12, right: 12),
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          color: isFree ? indicatorColor : Colors.grey,
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(16))),
                ),
              ],
            ),
          ),
          Text(name), //ユーザーネーム
        ],
      )),
    );
  }
}

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
