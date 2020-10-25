import 'package:asoble_app/pages/setup/welcome.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../global_event_list.dart';

class CommunityHomePage extends StatefulWidget {
  @override
  CommunityHomePageState createState() {
    return CommunityHomePageState();
  }
}

class CommunityHomePageState extends State<CommunityHomePage>{
  int _currentInfo = 0;
  int _currentEvent = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: CustomScrollView(
          slivers: <Widget>[
           SliverAppBar(
          floating: true,
          pinned: true,
          snap: false,

          expandedHeight: mediaSize.height*0.25,

            flexibleSpace: FlexibleSpaceBar(
                background: Image(image:AssetImage("lib/assets/demo2.jpeg"),
                  fit: BoxFit.cover,
                ),
            ),
              title: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,

                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                               child: Text('CommunityName No,1'),
                        )),


                  ),
                ],
              ),
          ),
            SliverList(
              delegate: SliverChildListDelegate(
                    <Widget>[
                   Padding(
                     padding: const EdgeInsets.only(top:18.0),
                     child: CarouselSlider(
                        items: currentPartyList,
                        options: CarouselOptions(
                            height: 180,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 6),
                            autoPlayAnimationDuration: Duration(milliseconds: 1200),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentEvent = index;
                              });
                            })),
                   ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: currentPartyList.map((widget) {
                        int index = currentPartyList.indexOf(widget);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentEvent == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:18.0),
                      child: CarouselSlider(
                        items: currentCommunityInfoList,
                        options: CarouselOptions(
                        height: 180,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 8),
                        autoPlayAnimationDuration: Duration(milliseconds: 1200),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                        setState(() {
                        _currentInfo = index;
                        });
                        })),
                    ),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: currentCommunityInfoList.map((widget) {
                  int index = currentCommunityInfoList.indexOf(widget);
                  return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentInfo == index
                  ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                  );
                  }).toList(),
                  ),



                      Padding(
                        padding: const EdgeInsets.only(top:18.0),
                        child: CarouselSlider(
                            items: currentPartyList,
                            options: CarouselOptions(
                                height: 180,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 6),
                                autoPlayAnimationDuration: Duration(milliseconds: 1200),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentEvent = index;
                                  });
                                })),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: currentCommunityInfoList.map((widget) {
                          int indexInfo = currentCommunityInfoList.indexOf(widget);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentEvent == indexInfo
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),




                      ]),
            ),
            ],));

  }

  }

List<Widget> currentCommunityInfoList =[
  CurrentPartyListWidget(partyName: "新しく〇〇さんが参加しました", partyInfo: "みんなで歓迎しましょう！",index:10),
  CurrentPartyListWidget(partyName: "来週土曜日は△△さんのお誕生日です", partyInfo: "みんなでお祝いしましょう！",index:11),
  CurrentPartyListWidget(partyName: "先週から新たに３つのタグが登録されました", partyInfo: "チェックしてみよう！",index:12),

];
