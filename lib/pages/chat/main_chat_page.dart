import 'package:asoble_app/pages/friend_list.dart';
import 'package:asoble_app/pages/navigation_bar/navigation_bar.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class MainChatPage extends StatefulWidget{

  MainChatPageState createState() => MainChatPageState();
}

class MainChatPageState extends State<MainChatPage>{
  Color _toggleInviteColor=Colors.blue;
  Color _toggleBoardColor=Colors.grey;
  int selectedIndex=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithDropDown(context),
      body:Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                     selectedIndex = 0;
                      _toggleInviteColor=Colors.blue;
                      _toggleBoardColor=Colors.grey;
                      });
                    },
                    child:Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),),
                        color: _toggleInviteColor,),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("おさそい"),
                      ),
                    )),
                GestureDetector(

                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                        _toggleInviteColor=Colors.grey;
                        _toggleBoardColor=Colors.blue;
                      });
                    },
                    child:Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10),),
                        color: _toggleBoardColor,),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("掲示板"),
                      ),
                    )
                ),
              ],
            ),
          ),

          Visibility(
            visible: selectedIndex==0?true:false,
            child: ListView(
              shrinkWrap: true,
              children: [
                FriendCard(name:"山田",isFree:true,userColor: Colors.blue,),
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
              child: Center(child: Text(boardTitle,style: TextStyle(color: Colors.white),)),
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



