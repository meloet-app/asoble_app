import 'package:asoble_app/pages/unique_friend_page/friend_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'friend_asoble_indicator.dart';
import 'friend_face_icon.dart';


//===============フレンド表示ウィジェット===================

//==============-フレンドカード=====================
class FriendCard extends StatelessWidget {

  String name;
  bool isFree;
  Color userColor;

  FriendCard({this.name, this.isFree, this.userColor});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => FriendProfilePage(
                  userName: name,              //TODO userID一括化
                  userColor: userColor,
                  userIsFree: isFree,
                )));
      },
      child: Card(
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                child: Stack(
                  children: [
                    FriendFaceIcon(userColor:userColor),   //class:トプ画顔アイコン
                    FriendAsobleIndicator(isFree:isFree)   //class:緑色インジケータ
                  ],
                ),
              ),
              Text(name), //ユーザーネーム
            ],
          )),
    );
  }
}
//==============-フレンドカード=====================


//===============フレンド表示ウィジェット　以上===================



