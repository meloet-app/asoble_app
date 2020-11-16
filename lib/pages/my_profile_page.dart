import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              SafeArea(
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: FloatingActionButton(
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
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                new AssetImage("lib/assets/user_icon1.jpg")))),
              )
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
                      child: Column(
                        children: [
                          Icon(
                            Icons.group_add,
                            size: 40,
                          ),
                          Text("友達を追加")
                        ],
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
