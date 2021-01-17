import 'package:asoble_app/pages/friendRequest/add_freind_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login_check.dart';



class MyProfilePage extends StatelessWidget {
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
                          image: new AssetImage("lib/assets/demo2.jpeg")))),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                new AssetImage("lib/assets/user_icon1.jpg")))),
              ),
              SafeArea(child: FloatingActionButton(
                backgroundColor: Colors.blue.withOpacity(0.9),
                heroTag: "heroMyProfileBack",
                child:Icon(Icons.arrow_back),
                onPressed: ()=>Navigator.pop(context),
              ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "User Name",
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
                "新宿駅南口",
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
                          ],
                        ),
                      ),
                      Container(
                        width: mediaSize.width * 0.3,
                        child: Column(children: [
                          Icon(
                            Icons.outgoing_mail,
                            size: 40,
                          ),
                          Text("遊びに誘う")
                        ]),
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: mediaSize.width * 0.3,
                      child: GestureDetector(
                        onTap:()=>Navigator.push(context, CupertinoPageRoute(builder: (context) => RequestFriendPage())),
                        child: Column(
                          children: [
                            Icon(
                              Icons.group_add,size: 40,),
                            Text("友達を追加")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: mediaSize.width * 0.3,
                      child: Column(
                        children: [
                          Icon(
                            Icons.group_rounded,
                            size: 40,
                          ),
                          Text("コミュニティ")
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
                  ],
                ),
              ]),
        ),
      ],
    ));
  }
}
