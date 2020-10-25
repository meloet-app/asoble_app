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
    return new Scaffold(
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int i) {
                  if (i.isOdd) return Divider();
                  final index = i ~/ 2;
                  if (index < 4) {
                    return new GestureDetector(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => EventDetailPage(context:context,index:index)));

                      },
                      child: Card(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 6, top: 6, right: 12, bottom: 6),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green, width: 2),
                                    borderRadius: BorderRadius.circular(60)),
                              ),
                              Text("イベントその" + index.toString()),
                            ],
                          )),
                    );
                  } else {
                    return null;
                  }
                }),
          )
        ],
      ),
    );
  }
}










List<Widget> currentCommunityPartyList = [
  CurrentPartyListWidget(partyName: "ZOOM飲み！！！", partyInfo: "夜７時から",index:10),
  CurrentPartyListWidget(partyName: "有楽町でしっぽり！！！", partyInfo: "夜９時から",index:11),
  CurrentPartyListWidget(partyName: "歌舞伎町でバチコり！！！", partyInfo: "夜１０時から",index:12),
  CurrentPartyListWidget(partyName: "多摩センターでゲロのみ！！！", partyInfo: "夜１０時から",index:13),
];
