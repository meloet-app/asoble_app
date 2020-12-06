import 'package:asoble_app/pages/friend_item/friend_asoble_indicator.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'friend_profile_appbar.dart';
import 'friend_profile_information.dart';
import 'friend_profile_menu.dart';

//===================フレンドプロフィール====================


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
            FriendProfileAppBar(userColor: userColor,userIsFree: userIsFree,userName: userName,),
            FriendProfileInformation(userColor: userColor,userIsFree: userIsFree,userName: userName,),
            FriendProfileMenu(),
          ],
        ));
  }
}

