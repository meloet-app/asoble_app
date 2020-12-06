

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendProfileInformation extends StatelessWidget{

  String userName;
  Color userColor;
  bool userIsFree;

  FriendProfileInformation({this.userName,this.userColor,this.userIsFree});

  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
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
    ],
  );

  }

}