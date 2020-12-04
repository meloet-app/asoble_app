import 'package:asoble_app/pages/navigation_bar/navigation_bar.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class MainChatPage extends StatefulWidget{

  MainChatPageState createState() => MainChatPageState();
}

class MainChatPageState extends State<MainChatPage>{
  Color _allSelectColor=Colors.blue;
  Color _inviteSelectColor=Colors.grey;
  Color _eventColor=Colors.grey;
  Color _communityColor=Colors.grey;
  Color _talkColor=Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithDropDown(context),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: mediaSize.width*0.9,
              height: 60.0,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: FlatButton(
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:Text("全員"),
                          onPressed: (){
                            setState(() {
                              _allSelectColor=Colors.blue;


                              _inviteSelectColor=Colors.grey;
                              _eventColor=Colors.grey;
                              _communityColor=Colors.grey;
                              _talkColor=Colors.grey;
                            });


                          },
                          color: _allSelectColor,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: FlatButton(
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:Text("おさそい"),
                          onPressed: (){
                            setState(() {
                              _inviteSelectColor=Colors.blue;

                              _allSelectColor=Colors.grey;
                              _eventColor=Colors.grey;
                              _communityColor=Colors.grey;
                              _talkColor=Colors.grey;
                            });
                          },
                          color: _inviteSelectColor,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: FlatButton(
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:Text("イベント"),
                          onPressed: (){
                            setState(() {
                              _eventColor=Colors.blue;

                              _inviteSelectColor=Colors.grey;
                              _allSelectColor=Colors.grey;
                              _communityColor=Colors.grey;
                              _talkColor=Colors.grey;
                            });
                          },
                          color: _eventColor,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: FlatButton(
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:Text("コミュニティ"),
                          onPressed: (){
                            setState(() {
                              _communityColor=Colors.blue;

                              _eventColor=Colors.grey;
                              _inviteSelectColor=Colors.grey;
                              _allSelectColor=Colors.grey;
                              _talkColor=Colors.grey;
                            });
                          },
                          color: _communityColor,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: FlatButton(
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:Text("雑談"),
                          onPressed: (){
                            setState(() {
                              _talkColor=Colors.blue;

                              _communityColor=Colors.grey;
                              _eventColor=Colors.grey;
                              _inviteSelectColor=Colors.grey;
                              _allSelectColor=Colors.grey;
                            });
                          },
                          color: _talkColor,)),
                  ),
                ],
              ),
            ),
          ),

          ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width:mediaSize.width*0.8,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("おさそいチャット",
                                    style: TextStyle(fontSize: 20),),
                              ),
                            Text("さそわれた：２",),
                              Text("返事がきた：２",),
                            ],
                          ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width:mediaSize.width*0.8,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("イベントチャット", style: TextStyle(fontSize: 20)),
                            ),
                            Text("参加予定：２",),
                          ],
                        )
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width:mediaSize.width*0.8,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("コミュニティチャット",style: TextStyle(fontSize: 20)),
                            ),
                            Text("新着：２",),
                          ],
                        )),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width:mediaSize.width*0.8,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("雑談チャット",style: TextStyle(fontSize: 20)),
                            ),
                            Text("新着：２",),
                          ],
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]
      )
    );
  }
}



