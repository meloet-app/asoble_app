import 'package:asoble_app/pages/friend_item/friend_asoble_indicator.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//===============フレンドプロフィールヘッダー=================
class FriendProfileAppBar extends StatelessWidget{

  String userName;
  Color userColor;
  bool userIsFree;

  FriendProfileAppBar({this.userColor,this.userName,this.userIsFree});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaSize.height * 0.24 + 40,
      child: Stack(
        children: [
          //------------------------背景画像-----------------------
          Container(
              width: mediaSize.width,
              height: mediaSize.height * 0.24,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: new AssetImage("lib/assets/demo2.jpeg")   //プロフィールホームイメージ画像
                  )
              )
          ),
          //----------------------戻るボタン-----------------------
          SafeArea(
            child: Align(
              alignment: AlignmentDirectional.topStart,       //戻るボタン
              child: FloatingActionButton(
                  heroTag: "hero1",
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: ()=>Navigator.of(context).pop()  //戻る
              ),
            ),
          ),
          //--------------------トプ画アイコン-----------------
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: 130,
              width:130,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                            border: Border.all(color: userColor, width: 2),
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                new AssetImage("lib/assets/user_icon1.jpg")  //アイコン画像
                            ))),
                  ),
                  //--------------------------asobleインジケーター------------------------
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        margin: EdgeInsets.only(top: 32, right: 16),
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            color: userIsFree ? FriendAsobleIndicator().indicatorColor : Colors.grey,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(28))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

