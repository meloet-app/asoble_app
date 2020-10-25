import 'package:asoble_app/pages/mypages/in_community/community_home.dart';
import 'package:flutter/material.dart';

import 'community_event_list.dart';

class CommunityNavigationBar extends StatefulWidget {
  @override
  CommunityNavigationBarState createState() {
    return CommunityNavigationBarState();
  }
}



class CommunityNavigationBarState extends State<CommunityNavigationBar> {
  static List<Widget> _pageList = [
    CommunityHomePage(),
    CommunityEventPage(),
    CommunityInfoPage()
  ];

  var _navIndex = 0;
  var _label = '';
  var _titles = ['Contacts', 'Map', 'Chat'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Events'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Info'),
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
        body: Center(child:Text("CommunityInfoPage")),

      );
  }
}



