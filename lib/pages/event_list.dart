import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'event_item/event_list.dart';
import 'navigation_bar/navigation_bar.dart';


class EventPage extends StatelessWidget {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithDropDown(context),
      body: Padding(
        padding: const EdgeInsets.only(top:32.0),
        child: Center(
          child: friendListWidget(),
        ),
      ),
    );
  }



  Widget friendListWidget() {
    List<Widget> widgetList = new List<Widget>();
    for (var i = 0; i < currentCommunityPartyList.length; i++) {
      widgetList.add(
          new EventCard(
          eventName: currentCommunityPartyList[i][0],
          time: currentCommunityPartyList[i][1],
          index: currentCommunityPartyList[i][2]));
    }
    return new ListView(children: widgetList);
  }


}



class EventCard extends StatelessWidget {

  String eventName;
  String time;
  int index;

  EventCard({ this.eventName, this.time, this.index });

  Color indicatorColor = const Color(0xff33CC10);

  @override
  Widget build(BuildContext context) {

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: mediaSize.width * 0.25,
              child: Column(
                  children: [
                    Text("11/28",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                    Text(time,style: TextStyle(fontSize: 20,),),
                  ],
                ),
          ),
          Container(
            height: mediaSize.height*0.25,
              width: mediaSize.width*0.65,
              child: CurrentPartyListWidget(
                partyInfo: time,
                partyName: eventName,
                index: index,
                timeDisplay:false,
              ),
          ),
        ]
    );
  }
}



List<List> currentCommunityPartyList = [
  ["ZOOM飲み！！！", "PM 7:00 〜", 10],
  ["有楽町でしっぽり！！！", "PM 9:00 〜", 11],
  ["歌舞伎町でバチコり！！！", "PM 10:00 〜", 12],
  ["多摩センターでゲロのみ！！！", "PM 10:00 〜", 13],
  ["歌舞伎町でバチコり！！！", "PM 10:00 〜", 12],
  ["多摩センターでゲロのみ！！！", "PM 10:00 〜", 13],
];
