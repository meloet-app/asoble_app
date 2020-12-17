import 'package:asoble_app/models/current_event_model.dart';
import 'package:asoble_app/models/input_asoble_info_model.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:asoble_app/test/test_console.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../login_check.dart';
import 'event_item/event_carousel.dart';
import 'event_item/event_list.dart';
import 'input_asoble_pages/input_asoble_page.dart';
import 'navigation_bar/navigation_bar.dart';

/*TODO 立ち上げ時のポップアップ

  ========================
  今日のイベントはこちら

  時間　イベント名
  時間　イベント名

  新しくできたイベントはこちら

  時間　イベント名
  時間　イベント名


  □次から表示しない

    [スキップ]

  ========================

*/

//TODO データベースできたら消す
List<String> CommunityDisplayList = ["全員", "コミュニティ１コミュニティ１コミュニティ１", "コミュニティ２"];


//＝＝＝＝＝＝＝＝＝＝＝ホームページ（ナビゲーションindex:0）==========================

class MyHomePage extends StatelessWidget {




  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  int carouselIndex = 0;



  @override
  Widget build(BuildContext context) {
    mediaSizeDefine(context);
    return Scaffold(
      appBar: AppBarWithDropDown(), //class:ドロップダウンありヘッダー
      body: Center(
        child: Wrap(
          children: [
            EventCarousel(), //class:イベントカルーセル
            EventCarouselIndicator(), //class:カルーセル下ドットインジケータ
            HomePageAsobleWidget(),//class:自分が遊べるかどうか見る&ボタン

          ],
        ),
      ),


      //====================TEST=====================
      floatingActionButton: FloatingActionButton(
        child: Icon(
            Icons.wifi
        ),
        onPressed: ()=>  Navigator.push(
        context,
    MaterialPageRoute(
    builder: (context) => DataBaseTestPage(),))
      ),
      //=====================TEST=====================

    );

  }
}




//======================================ホームページ　以上==================================




//=========================遊べることを知らせるボタン===============================
class HomePageAsobleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaSize.height * 0.24,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              width: mediaSize.width * 0.9, //TODO　大きさ調整
              height: mediaSize.height * 0.2,
              child: Card(   //TODO イラスト
                child:
                Center(child: Text("フレンドにヒマを知らせて、\nお誘いを待ちましょう")),
              ),
            ),
          ),
          //TODO 今自分が遊べるかどうかでウィジェット変える
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child:

              //-----------------ボタン----------------

              RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => notify_Asoble()));
                  },
                  color: Colors.blue[200], //TODO 色
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
    )
    ;
  }
}
//=========================遊べることを知らせるボタン　以上===============================



