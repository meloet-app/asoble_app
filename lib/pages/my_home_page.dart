import 'package:asoble_app/models/current_event_model.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'event_item/event_carousel.dart';
import 'event_item/event_list.dart';
import 'navigation_bar/navigation_bar.dart';

List<String> CommunityDisplayList = ["全員", "コミュニティ１コミュニティ１コミュニティ１", "コミュニティ２"];

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  static var carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithDropDown(),
      body: Container(
        child: Center(
          child: Wrap(
            children: [
              EventCarousel(),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: new Consumer<EventCarouselModel>(
                    builder: (context, model, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: currentPartyList.map((widget) {
                      int index = currentPartyList.indexOf(widget);
                      return Container(
                        width: 6.0,
                        height: 6.0,
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: model.selectedEventCarouselIndex == index
                              ? Color.fromRGBO(0, 0, 0, 0.9)
                              : Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                      );
                    }).toList(),
                  );
                }),
              ),
              Container(
                height: mediaSize.height * 0.24,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        width: mediaSize.width * 0.8,
                        height: mediaSize.height * 0.2,
                        child: Card(
                          child:
                              Center(child: Text("フレンドにヒマを知らせて、\nお誘いを待ちましょう")),
                        ),
                      ),
                    ),
                    //TODO ボタン位置調整（ガチ）
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: RaisedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    title: Text("タイトル"),
                                    content:
                                        Text("メッセージメッセージメッセージメッセージメッセージメッセージ"),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Container(
                                width: mediaSize.width * 0.35,
                                child: Text(
                                  "ヒマを知らせる",
                                  textAlign: TextAlign.center,
                                ))),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
