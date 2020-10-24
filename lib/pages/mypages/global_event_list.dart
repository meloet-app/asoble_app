import 'package:asoble_app/pages/setup/welcome.dart';
import 'package:carousel_slider/carousel_slider.dart';



import 'package:flutter/material.dart';

class GlobalEventListPage extends StatefulWidget{
  @override
  GlobalEventListPageState createState() {
    return GlobalEventListPageState();
  }
}

class GlobalEventListPageState extends State<GlobalEventListPage>{
int _current=0;

  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
        appBar: AppBar(),
        body:
        Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:48.0,bottom:24),
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
                          _current = index;
                        });
                      })
                ),
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
                    color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                    );
                    }).toList(),
                    )

            ],

          ),

      );
  }
}

class CurrentPartyListWidget extends StatelessWidget{
  String partyName;
  String partyInfo;
  CurrentPartyListWidget({this.partyName,this.partyInfo});

  @override
  Widget build(BuildContext context) {
    return
        Container(
          width: mediaSize.width*0.7,
          child: Padding(
            padding: const EdgeInsets.only(bottom:28.0),
            child: Card(
              elevation: 10,
              child:Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(partyName,style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(partyInfo),
                  ],
                ),
              )

            ),
          ),
        );
  }
}

List<Widget> currentPartyList = [
  CurrentPartyListWidget(partyName:"ZOOM飲み！！！",partyInfo:"夜７時から"),
  CurrentPartyListWidget(partyName:"有楽町でしっぽり！！！",partyInfo:"夜９時から"),
  CurrentPartyListWidget(partyName:"歌舞伎町でバチコり！！！",partyInfo:"夜１０時から"),
  CurrentPartyListWidget(partyName:"多摩センターでゲロのみ！！！",partyInfo:"夜１０時から"),
];




