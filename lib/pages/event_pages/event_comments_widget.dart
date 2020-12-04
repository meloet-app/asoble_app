
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCommentsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      SliverList(
          delegate: SliverChildListDelegate(
              commentsListWidget()
          ));

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
     child:


         Column(
           children: [
             Container(
               width:mediaSize.width*0.9,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.grey.withOpacity(0.2),),
               child:Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       children: [
                         Text(name,style: TextStyle(fontSize:16,decoration: TextDecoration.underline,),),
                         Text("　　　11/19(火) 16:28",)
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(bottom:8.0,left:8.0,right:8.0),
                     child: Text(comment,overflow: TextOverflow.clip,textAlign: TextAlign.left,),
                   ),

                 ],),
               )
             ),
             CustomPaint(
               painter: TrianglePainter(),
               child: Container(
                   height: 20
               ),
             ),
           ],
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

class TrianglePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Colors.transparent;
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    // 三角（塗りつぶし）
    paint.color = Colors.grey.withOpacity(0.2);
    var path = Path();
    path.moveTo(size.width / 10, 0);
    path.lineTo(size.width / 15, size.height );
    path.lineTo(size.width / 4, 0);
    path.close();
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

