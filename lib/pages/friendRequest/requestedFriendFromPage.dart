
import 'package:asoble_app/pages/friendRequest/requestedFriendToPage.dart';
import 'package:asoble_app/pages/friend_item/friend_asoble_indicator.dart';
import 'package:asoble_app/pages/friend_item/friend_face_icon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../firebase_var.dart';
import '../../login_check.dart';
import 'add_freind_page.dart';

class RequestedFriendFrom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(child: Icon(Icons.person_add),onPressed: ()=>Navigator.push(context, CupertinoPageRoute(builder: (context) => RequestFriendPage()))),
        appBar: AppBar(title: Text("フレンド申請一覧")),
        body: Column(
          children: [
            Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("申請を許可してフレンドになりましょう。")),
            ),
            StreamBuilder<QuerySnapshot>( //SnapShotではないときはFutureBuilderとget()とfuture:
              // 投稿メッセージ一覧を取得（非同期処理）
              // 投稿日時でソート
                stream: FirebaseFirestore.instance.collection("friendRequests")
                    .doc(uid).collection("requestFrom").orderBy(
                    "createdAt", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  // データが取得できた場合
                  if (snapshot.hasData) {
                    // 取得した投稿メッセージ一覧を元にリスト表示
                    return
                      Expanded(
                          child: Stack(
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.size,
                                    itemBuilder: (context, index) {
                                      final DocumentSnapshot _card = snapshot
                                          .data
                                          .docs[index];
                                      if (_card['status'] == 0) {
                                        final DateTime requestDate = _card['createdAt']
                                            .toDate();
                                        return

                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) {
                                                    return SimpleDialog(
                                                        title: Center(
                                                            child: Text(
                                                                "フレンド申請を許可しますか？")),
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              Container(
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  decoration: new BoxDecoration(
                                                                      border: Border
                                                                          .all(
                                                                          color: Colors
                                                                              .blue,
                                                                          width: 2),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      image: new DecorationImage(
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          image:
                                                                          new AssetImage(
                                                                              "lib/assets/user_icon1.jpg")))),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .all(8.0),
                                                                child: Text(
                                                                  _card['name'],
                                                                  style: TextStyle(
                                                                      fontSize: 20),),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment
                                                                    .center,
                                                                children: [
                                                                  FlatButton(
                                                                    onPressed: () =>
                                                                        Navigator
                                                                            .pop(
                                                                            context),
                                                                    child: Text(
                                                                        "戻る"),
                                                                    color: Colors
                                                                        .grey
                                                                        .shade500,
                                                                  ),
                                                                  FlatButton(
                                                                    onPressed: () {
                                                                      acceptFriendRequest(
                                                                          _card);
                                                                      acceptFriendRequestCompleted(
                                                                          context,
                                                                          _card);
                                                                    },
                                                                    child: Text(
                                                                        "許可する"),
                                                                    color: Colors
                                                                        .blue,),
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ]);
                                                  });
                                            },
                                            child: Card(
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
                                                              isFree: true)
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
                                                        Text(requestDate.year
                                                            .toString() + "/" +
                                                            requestDate.month
                                                                .toString() +
                                                            "/" +
                                                            requestDate.day
                                                                .toString() +
                                                            "に申請されています。",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors.grey
                                                                  .shade600),),
                                                      ],
                                                    ), //ユーザーネーム
                                                  ],
                                                )),
                                          );
                                      } else if (_card['status'] != 0) {
                                        return Container();
                                      } else {
                                        return Container(
                                          child: Text("データが取得できませんでした。"),
                                        );
                                      }
                                    }),

                                Align(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: Container(
                                    height: 95,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Align(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 24.0),
                                    child: Container(
                                      child: RaisedButton(
                                          color: Colors.lightBlue,
                                          child: Container(
                                              height: 40,
                                              width: mediaSize.width * 0.8,
                                              child: Center(child: Text(
                                                  "フレンド申請を送ったひとリスト"))),
                                          onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => RequestedFriendTo()))),
                                    ),
                                  ),
                                ),

                              ])
                      );
                  }


                  // データが読込中の場合
                  return Center(
                    child: Text('読込中...'),
                  );
                }),


          ],
        ));
  }

  acceptFriendRequest(snapshot) {
    try {
      var batch = db.batch();

      var myFriendsDoc = db.collection("friends").doc(uid).collection(
          "friendsList").doc(snapshot.id); //TODO friendslistまでは別で定義
      print(myFriendsDoc);
      var requestFromHimDoc = db.collection("friendRequests")
          .doc(uid)
          .collection("requestFrom")
          .doc(snapshot.id);
      print(requestFromHimDoc);


      batch.set(myFriendsDoc, {
        "uid": snapshot.id,
        "name": snapshot["name"],
        "isFreeRef": true, //TODO isFreeRef
        "icon": "iconRef",
        "userInfoRef": "/users/${snapshot.id}",
      },);


      batch.delete(requestFromHimDoc);


      batch.commit().whenComplete(() => print("フレンド許可バッチ処理正常終了"));
    } catch (error) {
      print(error);
    }
  }

  acceptFriendRequestCompleted(context, snapshot) {
    print("complete");
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Center(child: Text("フレンド登録完了")),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Column(
                  children: [
                    Text("${snapshot["name"]}さんとフレンドになりました。"),
                    FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("OK")
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}