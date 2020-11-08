import 'package:asoble_app/models/select_community_model.dart';
import 'package:asoble_app/pages/mypages/routes.dart';
import 'package:asoble_app/pages/setup/signin.dart';
import 'package:asoble_app/pages/setup/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';



bool freeTag = false;
Color freeColor = Colors.grey[400];
Color noFreeColor = Colors.red;


List<String> CommunityDisplayList = ["全員", "コミュニティ１", "コミュニティ２"];

class MyHomePage extends StatelessWidget{
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {


    return
    MaterialApp(
      home:ChangeNotifierProvider<SelectCommunityModel>(
        create: (_)=> SelectCommunityModel(),
       child: new Scaffold(
         appBar: AppBar(title: Text("Home")
         ),


      body:Center(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Consumer<SelectCommunityModel>(
                  builder: (context, model, child) {
                    return DropdownButton<String>(
                      underline:  Container(
                        height: 2,
                        color: Colors.grey,
                      ),

                      value: CommunityDisplayList[model.selectedCommunityIndex],
                      onChanged:(String newValue){
                        model.changeCommunity(newValue);
                        },
                      selectedItemBuilder: (context) {
                        return CommunityDisplayList.map((String item) {
                          return Container(

                            child: Text(
                              item,

                            ),
                          );
                        }).toList();
                      },
                      items: CommunityDisplayList.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: item == CommunityDisplayList[model.selectedCommunityIndex]
                                ? TextStyle(fontWeight: FontWeight.bold)
                                : TextStyle(fontWeight: FontWeight.normal),
                          ),
                        );
                      }).toList(),
                    );

                  }
                ),
              ),
            ),
          ],
        ),
      ),


)

    )
      );
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
            width: mediaSize.width*0.9,
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



