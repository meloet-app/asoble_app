


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCommentsWidget extends StatelessWidget {
  List <Widget> chin = [Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(color: Colors.grey,height: 200,),
  ),Container(color: Colors.grey,height: 200,)];

  @override
  Widget build(BuildContext context) {
    return
      SliverList(
          delegate: SliverChildListDelegate(commentsListWidget()));



  }
}

List <Widget> commentsListWidget() {

  List<Widget> _widgetList = new List<Widget>();

  for (var i = 0; i < commentList.length; i++) {
    _widgetList.add(new CommentWidget(
        name:commentList[i]["name"], comment: commentList[i]["comment"],));
  }
  return  _widgetList;
}


class CommentWidget extends StatelessWidget{
  String name;
  String comment;
  CommentWidget({this.name,this.comment});

  @override
  Widget build(BuildContext context) {
    return
   Padding(
     padding: const EdgeInsets.all(16.0),
     child: Container(color: Colors.grey.withOpacity(0.1),
       child:Column(
         children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(name,style: TextStyle(fontSize:16),),
         ),
         Padding(
           padding: const EdgeInsets.only(bottom:8.0,left:8.0,right:8.0),
           child: Text(comment,overflow: TextOverflow.clip,textAlign: TextAlign.left,),
         )
       ],)
     ),
   );
  }
}

List<Map<String ,String>> commentList=[
  {"name":"Taro Yamada","comment":"このイベント行きたい"},
  {"name":"Hanako 子林","comment":"すげ〜〜〜"},
  {"name":"David Baker","comment":"天才で草"},
  {"name":"Taro Yamada","comment":"行きたい行きたい行きたい行きたい行きたい行きたい行きたい行きたい行きたい行きたい"},
  {"name":"Taro Yamada","comment":"このイベント行きたい"},
  {"name":"Hanako 子林","comment":"すげ〜〜〜"},
  {"name":"David Baker","comment":"天才で草"},
  {"name":"Taro Yamada","comment":"行きたい行きたい行きたい行きたい行きたい行きたい行きたい行きたい行きたい行きたい"},

];



