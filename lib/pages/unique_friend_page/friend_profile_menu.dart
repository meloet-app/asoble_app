import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../login_check.dart';

class FriendProfileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: mediaSize.height * 0.4,
        width: mediaSize.width * 0.9,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            FriendProfileMenuItem(
              pageTitle: "参加するイベント",
              profileMenuIcon: Icons.nightlife,
            ),
            FriendProfileMenuItem(
              pageTitle: "予定カレンダー",
              profileMenuIcon: Icons.calendar_today_rounded,
            ),
            FriendProfileMenuItem(
              pageTitle: "チャット",
              profileMenuIcon: Icons.nightlife,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            FriendProfileMenuItem(
              pageTitle: "誘う",
              profileMenuIcon: Icons.outgoing_mail,
            ),
            FriendProfileMenuItem(
              pageTitle: "設定",
              profileMenuIcon: Icons.settings,
            ),
            Container(
              //空きスペース
              width: mediaSize.width * 0.3,
            ),
          ]),
        ]));
  }
}

class FriendProfileMenuItem extends StatelessWidget {
  String pageTitle;
  IconData profileMenuIcon;

  FriendProfileMenuItem({this.pageTitle, this.profileMenuIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaSize.width * 0.3,
      child: Column(
        children: [
          Icon(
            profileMenuIcon,
            size: 40,
          ),
          Text(pageTitle),
          //TODO 個別でイベントページ 作成
          //画面遷移、戻るボタンでこのページに戻れる
          //このイベントページからは他の人の情報は見れない
        ],
      ),
    );
  }
}
