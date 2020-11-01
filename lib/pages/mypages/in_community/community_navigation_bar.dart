import 'package:asoble_app/pages/mypages/in_community/community_home.dart';
import 'package:asoble_app/pages/mypages/my_profile.dart';
import 'package:flutter/material.dart';
import 'community_event_list.dart';
import 'community_friend_list.dart';

class CommunityNavigationBar extends StatefulWidget {
  @override
  CommunityNavigationBarState createState() {
    return CommunityNavigationBarState();
  }
}



class CommunityNavigationBarState extends State<CommunityNavigationBar> {
  static List<Widget> _pageList = [
    CommunityFriendPage(),

    CommunityInfoPage(),
    CommunityEventPage(),
    MyProfilePage(),
  ];

  var _navIndex = 0;
  var _label = '';
  var _titles = ['FreeFriend', 'Calender', 'Events','MyPage'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('CommunityName No,1'),
          ),
          actions:<Widget>[IconButton(icon: Icon(Icons.dehaze),
              iconSize: 40,
              onPressed: null)
          ],
        ),

      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.black,
          showUnselectedLabels:true,
          type:BottomNavigationBarType.fixed,


          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: '今遊べる友達',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_available),
            label:'みんなの予定',
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


class CommunityInfoPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(

        body: Center(child:Text("CommunityInfoPage")),

      );
  }
}



