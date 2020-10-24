import 'package:asoble_app/pages/mypages/routes.dart';
import 'package:asoble_app/pages/setup/signin.dart';
import 'package:asoble_app/pages/setup/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

import 'AppBar.dart';


bool freeTag = false;
Color freeColor = Colors.red;
String freeText ="ひまじゃない；；";



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width:mediaSize.width*0.7,

              child: ButtonTheme(
                height:80,

                child: RaisedButton(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),


                onPressed: () {
                  fromHomePageNavigation(context:context,navigation:1);
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                  child: Container(
                    height:80,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.blue[300],
                        Colors.blue[500],
                        Colors.blue[700],
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                   child: Center(child: const Text('freefriend人が遊びたがっています')),
                ),
            ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top:60),
              width: mediaSize.width*0.6,
              height:mediaSize.width*0.6,

              decoration: BoxDecoration(

                  border: Border.all(color: freeColor,width: 2),
                  borderRadius: BorderRadius.circular(mediaSize.width*0.6)
              ),

                    child:RaisedButton(
                      elevation: 10,
                      color: Colors.white,
                      onPressed: ()=> setState((){
                        freeTagChange();
                      }),
                     highlightColor: freeColor.withOpacity(0.3),
                     child: Text(freeText),
                  shape: CircleBorder(),
                  )
                ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                new HomePageButtons(context:context,homepageButtonText:"イベント",navigation:2),
                new HomePageButtons(context:context,homepageButtonText:"コミュニティ",navigation:3),
                new HomePageButtons(context:context,homepageButtonText:"プロフィール",navigation:4),

              ],
            )



          ],
        ),
      ));
  }
}



class HomePageButtons extends StatelessWidget{

  String homepageButtonText;
  int navigation;
  BuildContext context;
  HomePageButtons({this.context,this.homepageButtonText,this.navigation});


  @override
  Widget build(BuildContext context) {
    return
        Container(
          margin: EdgeInsets.only(top:60),
            width: mediaSize.width*0.25,
            height:mediaSize.width*0.25,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green,width: 2),
                borderRadius: BorderRadius.circular(mediaSize.width*0.25)
            ),

          child:RaisedButton(
            elevation: 10,
            color: Colors.white,
            onPressed: () => fromHomePageNavigation(context:context,navigation:navigation),
            child: Text(homepageButtonText),
            shape: CircleBorder(),
          )
        );
  }
}

fromHomePageNavigation({BuildContext context,int navigation}){



  Navigator.push(context, MaterialPageRoute(builder: (context) => navigationList[navigation] ));
}


Future freeTagChange() async{

  if (freeTag == true) {
    freeTag = false;
    freeColor = Colors.red;
    freeText = "ひまじゃない；；";
  } else {
    freeTag = true;
    freeColor = Colors.blue;
    freeText = "ひま！！！";
  }

  await FirebaseFirestore.instance
      .collection('users')
      .doc(userDocumentString)
      .update({'freeTag':freeTag});
}


