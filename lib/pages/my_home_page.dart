



import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'event_item/event_carousel.dart';
import 'navigation_bar/navigation_bar.dart';

List<String> CommunityDisplayList = ["全員", "コミュニティ１", "コミュニティ２"];

class MyHomePage extends StatelessWidget{
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {


    return
      Scaffold(
        appBar: AppBarWithDropDown(),
        body: Container(

                  child:Center(
                    child:Wrap(
                      children: [
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(top:16.0),
                            child:
                        EventCarousel(),)),
                            Container(
                              height:mediaSize.height*0.24,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment:AlignmentDirectional.center,
                                    child: Container(
                                      width:mediaSize.width*0.8,
                                      height:mediaSize.height*0.2,
                                      child: Card(
                                        child: Center(child: Text("フレンドにヒマを知らせて、\nお誘いを待ちましょう")),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.bottomCenter,
                                    child: RaisedButton(onPressed: (){
                                      showDialog(
                                        context: context,
                                        builder: (_) {
                                          return AlertDialog(
                                            title: Text("タイトル"),
                                            content: Text("メッセージメッセージメッセージメッセージメッセージメッセージ"),
                                            actions: <Widget>[
                                              // ボタン領域
                                              FlatButton(
                                                child: Text("Cancel"),
                                                onPressed: () => Navigator.pop(context),
                                              ),
                                              FlatButton(
                                                child: Text("OK"),
                                                onPressed: () => Navigator.pop(context),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                        color: Colors.blue[200],
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        ),
                                    child:Text("ヒマを知らせる")),
                                  )
                                ],
                              ),
                            )

                        ,Container(
                          height:mediaSize.height*0.24,
                          child: Stack(
                            children: [
                              Align(
                                alignment:AlignmentDirectional.center,
                                child: Container(
                                  width:mediaSize.width*0.8,
                                  height:mediaSize.height*0.2,
                                  child: Card(
                                    child: Center(child: Text("______さんと\n他○人が遊びたがっています")),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.bottomCenter,
                                child: RaisedButton(onPressed: (){
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: Text("タイトル"),
                                        content: Text("メッセージメッセージメッセージメッセージメッセージメッセージ"),
                                        actions: <Widget>[
                                          // ボタン領域
                                          FlatButton(
                                            child: Text("Cancel"),
                                            onPressed: () => Navigator.pop(context),
                                          ),
                                          FlatButton(
                                            child: Text("OK"),
                                            onPressed: () => Navigator.pop(context),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                    color: Colors.blue[200],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    child:Text("フレンド一覧を見る")),
                              )
                            ],
                          ),
                        )

                  ],
                    ),
                  ),

        ),
      );
  }
}


