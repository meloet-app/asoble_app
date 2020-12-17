import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/material.dart';

import '../../login_check.dart';


class EventInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      SliverList(
        delegate: SliverChildListDelegate(
            <Widget>[
      Padding(
        padding: const EdgeInsets.only(
            top: 32.0, left: 16.0, right: 16.0, bottom: 16.0),
        child: Container(
          width: mediaSize.width * 0.9,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("イベントについて",
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "このイベントの詳細についてここに書きます。このイベントの詳細についてここに書きます。このイベントの詳細についてここに書きます。このイベントの詳細についてここに書きます。このイベントの詳細についてここに書きます。",
                      overflow: TextOverflow.clip),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.money),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("2000円"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8, left: 8, right: 8),
                  child: Row(
                    children: [
                      Icon(Icons.timer),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("2020/11/13  19:00〜"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: RaisedButton(
          onPressed: () => print("マップ表示"),
          child: Row(
            children: [
              Icon(Icons.pin_drop),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("新宿駅南口　土間土間"),
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: RaisedButton(
          onPressed: () => print("プロフィール表示"),
          child: Row(
            children: [
              Icon(Icons.account_circle),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("山田太郎"),
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: RaisedButton(
          onPressed: () => print("参加者一覧表示"),
          child: Row(
            children: [
              Icon(Icons.group),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("参加予定者：6人"),
              )
            ],
          ),
        ),
      ),
      Container(height: 10)
    ]));
  }
}
