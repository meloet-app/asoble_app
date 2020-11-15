
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UniqueEventPage extends StatelessWidget {
  int index;
  String partyInfo;
  String partyName;

  UniqueEventPage({this.partyName,this.partyInfo,this.index});
  
  @override
  Widget build(BuildContext context) {
    return
   Scaffold(
     body:
         Stack(
           children: [
             Container(
               height: mediaSize.height-85,
               child: CustomScrollView(

                slivers: <Widget>[SliverAppBar(
                 pinned: true,

                 leading: Transform.scale(
                   scale: 0.9,
                   child: FloatingActionButton(
                     backgroundColor: Colors.lightBlue,
                       elevation: 0,
                       child: Icon(Icons.arrow_back_ios_outlined),
                     onPressed: ()=>Navigator.of(context).pop(),
                   ),
                 ),
                 flexibleSpace: FlexibleSpaceBar(
                   stretchModes: <StretchMode>[

                     StretchMode.zoomBackground
                   ],
                   centerTitle: true,
                   title: Text(partyName),
                   background: Stack(
                     fit: StackFit.expand,
                     children: [
                       Image(
                         fit: BoxFit.fitWidth,
                         image: AssetImage('lib/assets/eventdemo1.jpeg'),
                       ),
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

                     ],
                   ),
                 ),
                 backgroundColor: Colors.lightBlue,
                 expandedHeight: mediaSize.width*9/16,

               ),
               SliverList(

               delegate: SliverChildListDelegate(

               <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(top:32.0,left:16.0,right:16.0,bottom:16.0),
                   child: Container(
                     width:mediaSize.width*0.9,
                     decoration: BoxDecoration(

                       border: Border.all(color: Colors.lightBlue),
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child:Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text("イベントについて",
                                 style: TextStyle(
                                   fontSize: 16,
                               decoration: TextDecoration.underline,
                             )),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text("このイベントの詳細についてここに書きます。このイベントの詳細についてここに書きます。このイベントの詳細についてここに書きます。このイベントの詳細についてここに書きます。このイベントの詳細についてここに書きます。",
                               overflow:TextOverflow.clip),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               children: [
                                 Icon(Icons.money),
                                 Padding(
                                   padding: const EdgeInsets.only(left:8.0),
                                   child: Text("2000円"),
                                 )
                               ],
                             ),
                           ),

                         Padding(
                           padding: const EdgeInsets.only(top:8.0,bottom:8,left:8,right:8),
                           child: Row(
                             children: [
                               Icon(Icons.timer),
                               Padding(
                                 padding: const EdgeInsets.only(left:8.0),
                                 child: Text("2020/11/13  19:00〜"),
                               )
                             ],
                           ),
                         ),

                         ],
                       ),
                     ),
                   ),
                 ),


                 Padding(
                   padding: const EdgeInsets.only(left:16.0,right:16),
                   child: RaisedButton(
                     onPressed: ()=>print("マップ表示"),
                     child: Row(
                       children: [
                         Icon(Icons.pin_drop),
                         Padding(
                           padding: const EdgeInsets.only(left:8.0),
                           child: Text("新宿駅南口　土間土間"),
                         )
                       ],
                     ),

                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left:16.0,right:16),
                   child: RaisedButton(
                     onPressed: ()=>print("プロフィール表示"),
                     child: Row(
                       children: [
                         Icon(Icons.account_circle),
                         Padding(
                           padding: const EdgeInsets.only(left:8.0),
                           child: Text("山田太郎"),
                         )
                       ],
                     ),

                   ),
                 ),

                 Padding(
                   padding: const EdgeInsets.only(left:16.0,right:16),
                   child: RaisedButton(
                     onPressed: ()=>print("参加者一覧表示"),
                     child: Row(
                       children: [
                         Icon(Icons.group),
                         Padding(
                           padding: const EdgeInsets.only(left:8.0),
                           child: Text("参加予定者：6人"),
                         )
                       ],
                     ),

                   ),
                 ),
                 Container(height:10)


               ],
    ),
    ),
    ],),
             ),
             Align(
               alignment: AlignmentDirectional.bottomCenter,
               child: Container(
                 height:95,

                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     begin: FractionalOffset.topCenter,
                     end: FractionalOffset.bottomCenter,
                     colors: [
                       Colors.white.withOpacity(0),
                       Colors.white.withOpacity(1),
                     ],
                     stops: const [
                       0,
                       0.1,
                     ],),),),
             ),

               Align(
               alignment: AlignmentDirectional.bottomCenter,
               child: Padding(
                   padding: const EdgeInsets.only(bottom:24.0),
                   child: Container(

                     child: RaisedButton(
                       color: Colors.lightBlue,
                         child:Container(
                           height: 40,
                             width:100,
                             child: Center(child: Text("参加する"))),
                         onPressed: ()=>print("参加")),
                   ),
                 ),
               ),

             ],
         ),



     
   );     
  }
  
}