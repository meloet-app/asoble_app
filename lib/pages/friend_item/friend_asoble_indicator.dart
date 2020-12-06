import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//===============フレンドasobleインジケータ=========================


class FriendAsobleIndicator extends StatelessWidget {

  bool isFree;
  FriendAsobleIndicator({this.isFree});

  Color indicatorColor = const Color(0xff33CC10);     //asobleインジケータはこの色で統一

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
          margin: EdgeInsets.only(top: 12, right: 12),
          height: 16,
          width: 16,
          decoration: BoxDecoration(
              color: isFree ? indicatorColor : Colors.grey,    //isFreeのT/Fで灰色/緑色を変えるif文
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(16))),
    );

  }
}


//===============フレンドasobleインジケータ 以上=========================
