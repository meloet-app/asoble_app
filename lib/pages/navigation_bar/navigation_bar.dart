
import 'package:asoble_app/pages/chat/main_chat_page.dart';
import 'package:asoble_app/pages/my_home_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../calendar/calendar_page.dart';
import '../event_pages/event_list.dart';
import '../friend_list.dart';
import '../my_profile_page.dart';
import 'community_dropdown.dart';

class NavigationBar extends StatefulWidget {
  String uid;
  NavigationBar({this.uid});
  @override
  NavigationBarState createState() {
    return NavigationBarState(uid: uid);
  }
}


class NavigationBarState extends State<NavigationBar> {
  String uid;
  NavigationBarState({this.uid});

  static List<Widget> _pageList = [
    MyHomePage(),
    FriendPage(),
    MainChatPage(),
    EventPage(),
    CalendarPage(),
  ];

  var _navIndex = 0;
  var _label = '';
  var _titles = ['Home', 'Friends', 'Chat', 'Events', 'Calender'];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black45,
          selectedItemColor: Colors.black,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'ホーム',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: '友達',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'チャット',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.brunch_dining),
              label: 'イベント',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded),
              label: 'カレンダー',
            ),
          ],
          onTap: (int index) {
            setState(
              () {
                _navIndex = index;
                _label = _titles[index];
              },
            );
          },
          currentIndex: _navIndex,
        ),
        body: _pageList[_navIndex]);
  }
}






class AppBarWithDropDown extends StatelessWidget implements PreferredSizeWidget{
  AppBarWithDropDown({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
     return AppBar(
      title: PreferredSize(
        preferredSize: preferredSize,
          child: Center(
              child: CommunityDropdown())),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          iconSize: 40,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyProfilePage() ));
          },)
      ],
    );
  }
  }


  
