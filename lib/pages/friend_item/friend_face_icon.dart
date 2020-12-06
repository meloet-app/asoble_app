
//===============フレンド トプ画アイコン=======================
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendFaceIcon extends StatelessWidget {  //TODO　画像埋め込み
  Color userColor;
  FriendFaceIcon({this.userColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin:
        EdgeInsets.only(left: 6, top: 6, right: 12, bottom: 6),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: Colors.blueAccent[100], //TODO　画像埋め込み、差し替え
            border: Border.all(color: userColor, width: 2),
            borderRadius: BorderRadius.circular(60)),
      ),
    );
  }
}


//===============フレンド トプ画アイコン　以上=======================
