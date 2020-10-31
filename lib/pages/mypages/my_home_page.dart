import 'package:asoble_app/pages/mypages/routes.dart';
import 'package:asoble_app/pages/setup/signin.dart';
import 'package:asoble_app/pages/setup/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



bool freeTag = false;
Color freeColor = Colors.grey[400];
Color noFreeColor = Colors.red;




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

          children: [
            Padding(
              padding: const EdgeInsets.only(top:80),
              child: Text("遊べる人を探す"),
            ),
            Padding(
              padding: const EdgeInsets.only(top:32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width:mediaSize.width*0.35,

                    child: ButtonTheme(
                      height:mediaSize.width*0.35,

                      child: RaisedButton(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),


                      onPressed: () {
                        fromHomePageNavigation(context:context,navigation:6);
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                        child: Container(
                          height:mediaSize.width*0.35,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.blue[300],
                              Colors.blue[500],
                              Colors.blue[700],
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                         child: Center(child: const Text('全員から探す')),
                      ),
                  ),
                    ),
                  ),Container(
                    width:mediaSize.width*0.35,

                    child: ButtonTheme(
                      height:mediaSize.width*0.35,

                      child: RaisedButton(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),


                        onPressed: () {
                          fromHomePageNavigation(context:context,navigation:4);
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          height:mediaSize.width*0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.green[300],
                                Colors.green[500],
                                Colors.green[700],
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Center(child: const Text('コミュニティから探す')),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:48.0),
              child: Text("自分のこと"),
            ),

                new HomePageButtons(context:context,homepageButtonText:"自分のヒマを知らせる",navigation:1),
                new HomePageButtons(context:context,homepageButtonText:"マイページ",navigation:3),





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
          margin: EdgeInsets.only(top:40),
            width: mediaSize.width*0.7,
            height:mediaSize.width*0.24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green,width: 2),

            ),

          child:RaisedButton(
            elevation: 10,
            color: Colors.green.withOpacity(0.8),
            onPressed: () => fromHomePageNavigation(context:context,navigation:navigation),
            child: Text(homepageButtonText),

          )
        );
  }
}

fromHomePageNavigation({BuildContext context,int navigation}){

  Navigator.push(context, CupertinoPageRoute(builder: (context) => navigationList[navigation] ));
}



