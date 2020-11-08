import 'package:asoble_app/models/select_community_model.dart';
import 'package:asoble_app/pages/my_home_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../calender_page.dart';
import '../event_list.dart';
import '../friend_list.dart';
import '../my_profile_page.dart';
import 'community_dropdown.dart';


class NavigationBar extends StatefulWidget {
  @override
  NavigationBarState createState() {
    return NavigationBarState();
  }
}



class NavigationBarState extends State<NavigationBar> {
  static List<Widget> _pageList = [
    MyHomePage(),
    FriendPage(),
    CalenderPage(),
    EventPage(),
    MyProfilePage()
  ];

  var _navIndex = 0;
  var _label = '';
  var _titles = ['Home', 'Friends', 'Calender','Events','MyPage'];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

                bottomNavigationBar: BottomNavigationBar(
                  unselectedItemColor: Colors.black45,
                  selectedItemColor: Colors.black,
                  showUnselectedLabels:true,
                  type:BottomNavigationBarType.fixed,


                   items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                  label: 'ホーム',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group),
                  label:'友達',
                ),
                     BottomNavigationBarItem(
                       icon: Icon(Icons.calendar_today_rounded),
                       label:'カレンダー',
                     ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.brunch_dining),
                  label:'イベント',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label:'マイページ',
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
                body: _pageList[_navIndex]

              );

  }
}

Widget AppBarWithDropDown() {
  return AppBar(
    title:Center(child: CommunityDropdown()),
    actions:<Widget>[IconButton(icon: Icon(Icons.notifications,color: Colors.white,),
        iconSize: 40,
        onPressed: null)
    ],
  );

  }



