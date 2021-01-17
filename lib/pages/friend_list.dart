
import 'package:asoble_app/pages/friendRequest/add_freind_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../firebase_var.dart';
import 'friendRequest/requestedFriendFromPage.dart';
import 'friend_item/friend_asoble_indicator.dart';
import 'friend_item/friend_card.dart';
import 'friend_item/friend_face_icon.dart';
import 'navigation_bar/navigation_bar.dart';

//===============フレンドページ=====================

class FriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.person_add),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => RequestFriendPage()))),
      appBar: AppBarWithDropDown(),
      body: Container(child: Center(child: Column(
        children: [
          RaisedButton(
          child:Text("フレンド申請一覧"),
            onPressed:()=>Navigator.push(context, CupertinoPageRoute(builder: (context) => RequestedFriendFrom())),
          ),
          StreamBuilder<QuerySnapshot>( //SnapShotではないときはFutureBuilderとget()とfuture:
            // 投稿メッセージ一覧を取得（非同期処理）
            // 投稿日時でソート
              stream: FirebaseFirestore.instance.collection("friends")
                  .doc(uid).collection("friendsList").orderBy(
                  "isFreeRef",descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                // データが取得できた場合
                if (snapshot.hasData) {
                 var itemCount = snapshot.data.size;
                  if(itemCount !=0) {return
                    Expanded(
                      child:
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: itemCount,
                          itemBuilder: (context, index) {

                            final DocumentSnapshot _card = snapshot
                                .data
                                .docs[index];

                              return
                                Card(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            child: Stack(
                                              children: [
                                                FriendFaceIcon(
                                                    userColor: Colors
                                                        .blue),
                                                //class:トプ画顔アイコン
                                                FriendAsobleIndicator(
                                                    isFree: _card['isFreeRef'])
                                                //class:緑色インジケータ
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets
                                                    .only(
                                                    bottom: 4.0),
                                                child: Text(
                                                  _card['name'],
                                                  style: TextStyle(
                                                      fontSize: 18),),
                                              ),
                                            ],
                                          ), //ユーザーネーム
                                        ],
                                      )
                                );
                          }),
                    );}
                }


                // データが読込中の場合
                return Center(
                  child: Text('読込中...'),
                );
              }),
        ],
      ))),
    );
  }


  //============仮実装段階===============//
  //-------------フレンドの繰り返し表示メソッド----------------
  Widget friendListWidget() {

    List<Widget> widgetList = new List<Widget>();//このリストにループで作成したウィジェットをぶち込む

    for (var i = 0; i < list.length; i++) {  //フレンドListの長さ分だけループ、
      widgetList.add(new FriendCard(         //class:フレンドカードをリストに追加
          name: list[i], isFree: freelist[i], userColor: borderColorlist[i]));
    }
    return Flexible(
      child: new ListView(
          shrinkWrap: true,
          children: widgetList),
    );  //フレンドページに返す
  }
//-------------フレンドの繰り返し表示メソッド　以上----------------

}




//===============フレンドページ 以上=====================





//============テスト=============

List<String> list = [
  "山田太郎",
  "小山仁",
  "土方ポコ太",
  "土方ポコ美",
  "土方ポコ郎",
  "土方ポコ助",
  "土方ポコ子",
  "土方ポコ三郎",
];

List<bool> freelist = [
  true,
  false,
  true,
  true,
  true,
  true,
  true,
  true,
];

List<Color> borderColorlist = [
  Colors.green,
  Colors.blue,
  Colors.orange,
  Colors.orange,
  Colors.orange,
  Colors.orange,
  Colors.orange,
  Colors.orange,
];

//============テスト=============
