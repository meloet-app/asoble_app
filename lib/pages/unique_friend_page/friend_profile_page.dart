import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../friend_list.dart';

class FriendProfilePage extends StatelessWidget {


  String userName;
  Color userColor;
  bool userIsFree;

  FriendProfilePage({this.userName,this.userColor,this.userIsFree});



  @override

  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
          children: [
            Container(
              height: mediaSize.height * 0.24 + 40,
              child: Stack(
                children: [
                  Container(
                      width: mediaSize.width,
                      height: mediaSize.height * 0.24,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: new AssetImage("lib/assets/demo2.jpeg")
                          )
                      )
                  ),
                  SafeArea(
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: FloatingActionButton(
                          heroTag: "hero1",
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,

                          ),
                          onPressed: ()=>Navigator.of(context).pop()),
                    ),
                  ),
                  SafeArea(
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: FloatingActionButton(
                          heroTag: "hero2",
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: null),
                    ),
                  ),

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
                                        new AssetImage("lib/assets/user_icon1.jpg")))),

                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                margin: EdgeInsets.only(top: 32, right: 16),
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    color: userIsFree ? FriendCard().indicatorColor : Colors.grey,
                                    border: Border.all(color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(28))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                userName,
                style: TextStyle(fontSize: 28),
              ),
            ),
            Text(
              "ひとことコメントだよ〜",
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_pin),
                  Text(
                    "〜19:00 新宿駅南口",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              height: mediaSize.height * 0.4,
              width: mediaSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: mediaSize.width * 0.3,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.nightlife,
                                  size: 40,
                                ),
                                Text("参加するイベント")
                                //TODO 個別でイベントページ 作成
                                //画面遷移、戻るボタンでこのページに戻れる
                                //このイベントページからは他の人の情報は見れない
                              ],
                            ),
                          ),
                          Container(
                            width: mediaSize.width * 0.3,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.calendar_today_rounded,
                                  size: 40,
                                ),
                                Text("予定カレンダー")
                                //TODO 個別でカレンダーページ 作成
                                //画面遷移、戻るボタンでこのページに戻れる
                                //このカレンダーからは他の人の情報は見れない
                              ],
                            ),
                          ),
                          Container(
                            width: mediaSize.width * 0.3,
                            child: Column(
                                children: [
                              Icon(
                                Icons.chat,
                                size: 40,
                              ),
                              Text("トーク")
                            ]),
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Container(
                          width: mediaSize.width * 0.3,
                          child: Column(
                            children: [
                              Icon(
                                Icons.outgoing_mail,
                                size: 40,
                              ),
                              Text("誘う")
                            ],
                          ),
                        ),
                        Container(
                          width: mediaSize.width * 0.3,
                          child: Column(
                            children: [
                              Icon(
                                Icons.settings,
                                size: 40,
                              ),
                              Text("設定")
                            ],
                          ),
                        ),
                        Container(  //空きスペース
                          width: mediaSize.width * 0.3,


                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ));
  }
}

Widget ProfileSliverAppBar() {
  return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      backgroundColor: Colors.white70,
      expandedHeight: mediaSize.height * 0.25,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image(
          image: AssetImage("lib/assets/demo2.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      centerTitle: true,
      title: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('User_Name'),
          )),
      actions: <Widget>[]);
}
