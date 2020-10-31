import 'package:asoble_app/pages/mypages/routes.dart';
import 'package:asoble_app/pages/setup/signin.dart';
import 'package:asoble_app/pages/setup/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

import 'AppBar.dart';
import 'my_home_page.dart';


bool freeTag = false;
Color freeColor = Colors.grey[400];
Color noFreeColor = Colors.red;




class InformFreePage extends StatefulWidget {
  @override
  _InformFreePageState createState() => new _InformFreePageState();
}


class _InformFreePageState extends State<InformFreePage> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                          Container(
                              margin: EdgeInsets.only(top:60),
                              width: mediaSize.width*0.4,
                              height:mediaSize.width*0.25,

                              decoration: BoxDecoration(

                                border: Border.all(color: freeColor,width: 2),

                              ),

                              child:RaisedButton(

                                  elevation: 10,
                                  color: freeColor.withOpacity(0.8),
                                  onPressed: ()=> setState((){
                                    freeTagChange();
                                  }),
                                  highlightColor: freeColor.withOpacity(0.3),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ImageIcon(
                                        AssetImage('lib/assets/free_icon.png'),
                                          size:60
                                      ),
                                      Text("ヒマ！",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                                    ],
                                  )
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top:60),
                            width: mediaSize.width*0.4,
                            height:mediaSize.width*0.25,

                            decoration: BoxDecoration(

                              border: Border.all(color: noFreeColor,width: 2),

                            ),

                            child:RaisedButton(

                                elevation: 10,
                                color: noFreeColor.withOpacity(0.8),
                                onPressed: ()=> setState((){
                                  freeTagChange();
                                }),
                                highlightColor: noFreeColor.withOpacity(0.3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ImageIcon(
                                      AssetImage('lib/assets/nofree_icon.png',),
                                      size:60
                                    ),
                                    Text("ヒマじゃない",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                                  ],

                                )
                            ),
    ),

                        ]
                      ),
            new HomePageButtons(context:context,homepageButtonText:"カレンダーにヒマを入れる",navigation:1),
            new HomePageButtons(context:context,homepageButtonText:"イベントを立てる",navigation:3),
          ],
        )


        );
  }


}




Future freeTagChange() async{

  if (freeTag == true) {
    freeTag = false;
    freeColor = Colors.grey[400];
    noFreeColor = Colors.red;
  } else {
    freeTag = true;
    freeColor = Colors.blue;
    noFreeColor = Colors.grey[400];
  }

  await FirebaseFirestore.instance
      .collection('users')
      .doc(userDocumentString)
      .update({'freeTag':freeTag});
}


