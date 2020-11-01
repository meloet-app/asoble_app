import 'package:asoble_app/pages/setup/welcome.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../global_event_list.dart';

class CommunityEventPage extends StatefulWidget {
  @override
  CommunityEventPageState createState() {
    return CommunityEventPageState();
  }
}

class CommunityEventPageState extends State<CommunityEventPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Center(

        child: Container(


            child: friendListWidget()
        )
    );
  }

  Widget friendListWidget() {
    List<Widget> widgetList = new List<Widget>();
    for (var i = 0; i < currentCommunityPartyList.length; i++) {
      widgetList.add(new EventCard(
          eventName: currentCommunityPartyList[i][0],
          time: currentCommunityPartyList[i][1],
          index: currentCommunityPartyList[i][2]
      )
      );
    }
    return new ListView(children: widgetList);
  }
}

class EventCard extends StatelessWidget {


  String eventName;
  String time;
  int index;
  EventCard({this.eventName,this.time,this.index});

  Color indicatorColor = const Color(0xff33CC10);

  @override
  Widget build(BuildContext context) {
    return
          Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height:mediaSize.height*0.15+16.0,
              width:mediaSize.width*0.25 ,

                child:Center(child: Text(time))),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child:
              Center(
                child: new GestureDetector(
                  child: Card(
                  child: Container(
                    width: mediaSize.width*0.6,
                    height: mediaSize.height*0.15,

                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                       children:[
                         Text(eventName,style: TextStyle(fontWeight: FontWeight.bold),),
                         Text(time),
                       ])



                    ),
                  ),
                ),
              ),
            )
  ]);
  }
}






List<List> currentCommunityPartyList = [
  ["ZOOM飲み！！！",  "PM 7:00 〜",10],
  ["有楽町でしっぽり！！！", "夜９時から",11],
  ["歌舞伎町でバチコり！！！","夜１０時から",12],
  ["多摩センターでゲロのみ！！！", "夜１０時から",13],
  ["歌舞伎町でバチコり！！！","夜１０時から",12],
  ["多摩センターでゲロのみ！！！", "夜１０時から",13],
];
