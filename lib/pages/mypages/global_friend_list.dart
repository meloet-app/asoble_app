
import 'package:asoble_app/pages/mypages/routes.dart';
import 'package:asoble_app/pages/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'inviteParty.dart';





class GlobalFriendListPage extends StatefulWidget {
  @override
  _GlobalFriendListPageState createState() {
    return _GlobalFriendListPageState();
  }
}

class _GlobalFriendListPageState extends State<GlobalFriendListPage>{

  List<bool> isSelected = [true,false];
  Color freeFriendColor= Colors.greenAccent;
  bool isFreeFriend =true;


  List<Chip> _tagChips = [
    Chip(label: Text("tag0")),
    Chip(label: Text("tag1")),
    Chip(label: Text("tag2")),
    Chip(label: Text("tag3")),
    Chip(label: Text("tag4")),
    Chip(label: Text("tag5")),
    Chip(label: Text("tag6")),
  ];


  @override
  Widget build(BuildContext context) {

    return
      new Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [

              Container(

                width: mediaSize.width,
                height: mediaSize.height * 0.1,
                color: Colors.white70,
                child: Stack(
                  children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(

                                    iconSize: 40,
                                      icon: Icon(Icons.add_circle_outline),
                                      onPressed: ()=>selectTagDialog(context,_tagChips)),
                                ),
                              ),


                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ToggleButtons(
                          borderRadius: BorderRadius.circular(10),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("遊べる人",style:TextStyle(
                                  fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("全員",style:TextStyle(
                                  fontWeight: FontWeight.bold)),
                            ),
                          ],
                          isSelected: isSelected,
                          fillColor: freeFriendColor,
                          selectedColor:Colors.white,


                          onPressed: (int index) {
                            setState(() {


                              if (index == 0){
                                freeFriendColor = Colors.greenAccent;
                                isFreeFriend = true;
                              }else if(index == 1){
                                freeFriendColor = Colors.teal;
                                isFreeFriend = false;
                              }

                              for (int indexBtn = 0;indexBtn < isSelected.length;indexBtn++) {
                                if (indexBtn == index) {
                                  isSelected[indexBtn] = !isSelected[indexBtn];
                                } else {
                                  isSelected[indexBtn] = false;
                                }
                                if (indexBtn == index) {
                                  isSelected[indexBtn] = true;
                                } else {
                                  isSelected[indexBtn] = false;
                                }
                              }


                            });
                          },
                        ),

                      ),
                    ),
                        ],

                      ),
                    ),

              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int i) {
                        if (i.isOdd) return Divider();
                        final index = i ~/ 2;
                        if (index < 4 && isFreeFriend == true) {
                          return new GestureDetector(
                            onTap: ()=>FriendDialog(context,index),
                            child:  Card(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 6, top: 6, right: 12, bottom: 6),
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.green, width: 2),
                                          borderRadius: BorderRadius.circular(60)
                                      ),
                                    ),
                                    Text("名無し太郎その" + index.toString()),
                                  ],
                                )
                            ),
                          );
                        }else if(index < 12 && isFreeFriend == false){
                          return new GestureDetector(
                            onTap: ()=>FriendDialog(context,index),
                            child:  Card(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 6, top: 6, right: 12, bottom: 6),
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black, width: 2),
                                          borderRadius: BorderRadius.circular(60)
                                      ),
                                    ),
                                    Text("名無し太郎その" + index.toString()),
                                  ],
                                )
                            ),
                          );
                        }else{return null;}
                        }
                        )
                    ),


            ],
          )
      );
  }


}

FriendDialog(BuildContext context,int index){
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          contentPadding: EdgeInsets.only(top: 30.0,bottom:16.0),
        title: Text("名無し太郎さんその"+index.toString()+'さんのプロフィール'),
        children:[
          Center(child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:16.0),
                child: Text('今ヒマです'),
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  shape: const StadiumBorder(
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Text("戻る"),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  shape: const StadiumBorder(
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Text("遊びに誘う"),
                  onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => secondNavigationList[0]),
                ),
                ),]
              ,
            ),
      ])
      )
      ]
      );
    },
  );
}




Future selectTagDialog(BuildContext context,_tagChips) async {


  await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
            title: Text('タグを選んでください'),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(children: _tagChips),
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                shape: const StadiumBorder(
                  side: BorderSide(color: Colors.black),
                ),
                child: Text("戻る"),
                onPressed: () => Navigator.pop(context),
              ),
            ]);
      });
      }





