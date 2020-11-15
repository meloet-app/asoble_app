import 'package:asoble_app/pages/event_pages/unique_event_page.dart';
import 'package:asoble_app/setup/welcome.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../my_home_page.dart';

class CurrentPartyListWidget extends StatelessWidget {
  String partyName;
  String partyInfo;
  int index;
  CurrentPartyListWidget({this.partyName, this.partyInfo,this.index});

  @override
  Widget build(BuildContext context) {

    return Container(


      child: Padding(
        padding: const EdgeInsets.only(bottom: 28.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, CupertinoPageRoute(
                builder: (context) => UniqueEventPage(
                    partyName:partyName,partyInfo:partyInfo,index: MyHomePage.carouselIndex)));
          },
          child: Card(
              elevation: 10,

                child: Stack(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: new AssetImage(
                                  "lib/assets/eventdemo1.jpeg")
                          ),
                        ),),),

                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  Colors.white.withOpacity(0),
                                  Colors.lightBlue.withOpacity(0.9)
                                ],
                                stops: const [
                                  0.4,
                                  0.67,
                                ],)),
                            constraints: BoxConstraints.expand(),
                            ),

                  Container(
                          constraints: BoxConstraints.expand(),
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                  Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Text(
                                        partyName,
                                        style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),
                                        overflow:TextOverflow.ellipsis
                                    ),
                                  ),



                                    Padding(
                                      padding: const EdgeInsets.only(bottom:8.0,left:8,right:8),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left:8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.pin_drop,color: Colors.white,),
                                                Text(
                                                  "新宿駅北口かまどか",style: TextStyle(color: Colors.white),),

                                              Padding(
                                                padding: const EdgeInsets.only(left:8.0),
                                                child: Icon(Icons.account_circle,color: Colors.white,),
                                              ),
                                              Text(
                                                "田中康",style: TextStyle(color: Colors.white))
                                        ],
                                      ),
                                    ),

                                    ],
                                  ),

                                ),


                               /* Container(
                                    color: Colors.black.withOpacity(0.7),

                                    constraints: BoxConstraints.expand(
                                      height: mediaSize.height*0.25*0.25,),
                                    child: FlatButton(onPressed: null,
                                        child: Text("詳細",
                                          style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white),
                                        ))),*/


                                ]),
                          ),



                    ),
                    Align(alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(

                          height: 70,
                            width:70,

                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1.0,
                                  blurRadius: 10.0,
                                  offset: Offset(2, 2),

                                ),
                              ],
                                gradient: LinearGradient(
                                  begin: FractionalOffset.topLeft,
                                  end: FractionalOffset.bottomRight,
                                  colors: [
                                    Colors.lightBlueAccent.withOpacity(0.9),
                                    Colors.lightBlue.withOpacity(0.9)
                                  ],
                                  stops: const [
                                    0.4,
                                    1,
                                  ],),

                              borderRadius: BorderRadius.circular(70),
                            ),
                            child:Center(child: Text("11/13\n19:00〜",style: TextStyle(color: Colors.white),))

                        ),
                      ),),






                  ],
                ),
              )),
        ),

    );
  }
}



List<Widget> currentPartyList = [
  CurrentPartyListWidget(partyName: "ZOOM飲み！！！", partyInfo: "11/13 19:00〜",index:10),
  CurrentPartyListWidget(partyName: "有楽町でしっぽり！！！", partyInfo: "11/13 19:00〜",index:11),
  CurrentPartyListWidget(partyName: "歌舞伎町でバチコり！！！", partyInfo: "11/13 19:00〜",index:12),
  CurrentPartyListWidget(partyName: "多摩センターでゲロのみ！！！多摩センターでゲロのみ！！！多摩センターでゲロのみ！！！", partyInfo: "11/13 19:00〜",index:13),
];
