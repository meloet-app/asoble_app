import 'package:asoble_app/pages/friend_item/friend_card.dart';
import 'package:asoble_app/pages/navigation_bar/navigation_bar.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainChatPage extends StatefulWidget{
  MainChatPageState createState() => MainChatPageState();
}

class MainChatPageState extends State<MainChatPage>{
  Color toggleInviteColor=Colors.blue;
  Color toggleBoardColor=Colors.grey;
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithDropDown(context),
      body:Column(
        children: [

          Visibility(
            visible: selectedIndex==0?true:false,
            child: ListView(
              shrinkWrap: true,
              children: [
                FriendCard(name:"山田",isFree:true,userColor: Colors.blue,),   //TODO 繰り返し
                FriendCard(name:"山田",isFree:true,userColor: Colors.blue,),
                FriendCard(name:"山田",isFree:true,userColor: Colors.blue,)
              ],
            ),
          ),

          Visibility(
            visible: selectedIndex==1?true:false,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      BoardIconWidget(boardTitle:"全ての掲示板"),
                      BoardIconWidget(boardTitle:"コミュニティ掲示板")
                    ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      BoardIconWidget(boardTitle:"雑談掲示板"),
                      BoardIconWidget(boardTitle:"イベント掲示板")
                    ],),
                  ],
                )

          ),
        ]
      )
    );
  }
}



//=================タブ分け（チャット/掲示板）============================

class ChatModeToggleSwitch extends StatefulWidget{
  @override
  _ChatModeToggleSwitchState createState() => _ChatModeToggleSwitchState();
}

class _ChatModeToggleSwitchState extends State<ChatModeToggleSwitch> {
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  MainChatPageState().selectedIndex = 0;
                  MainChatPageState().toggleInviteColor=Colors.blue;
                  MainChatPageState().toggleBoardColor=Colors.grey;
                });
              },
              child:Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),),
                  color: MainChatPageState().toggleInviteColor,),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("おさそい"),
                ),
              )),
          GestureDetector(
              onTap: () {
                setState(() {
                  MainChatPageState().selectedIndex = 1;
                  MainChatPageState().toggleInviteColor=Colors.grey;
                  MainChatPageState().toggleBoardColor=Colors.blue;
                });
              },
              child:Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10),),
                  color: MainChatPageState().toggleBoardColor,),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("掲示板"),
                ),
              )
          ),
        ],
      ),
    );
  }
}


//=====================掲示板アイコン ======================

class BoardIconWidget extends StatelessWidget{
String boardTitle;
BoardIconWidget({this.boardTitle});

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Container(
        width: mediaSize.width*0.4,
        height:mediaSize.width*0.4+24,
        child: Stack(
          children: [

          Card(
            color: Colors.brown.shade400,
            child: Container(
            width: mediaSize.width*0.4,
              height:mediaSize.width*0.4,
              child: Center(
                  child: Text(
                    boardTitle,
                    style: TextStyle(
                        color: Colors.white),)),
          )
        ),
          Align(
            alignment:AlignmentDirectional.bottomCenter,
              child: RaisedButton(
                color: Colors.brown,
                child: Text("見る",style: TextStyle(color: Colors.white),),
                onPressed: ()=>null,
              ))
          ],
        ),

      ),
   );
  }
}
//=====================掲示板アイコン 以上======================


