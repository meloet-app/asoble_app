import 'package:asoble_app/pages/unique_friend_page/friend_profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../firebase_var.dart';
import 'friend_item/friend_asoble_indicator.dart';
import 'friend_item/friend_card.dart';
import 'friend_item/friend_face_icon.dart';
import 'navigation_bar/navigation_bar.dart';

//===============フレンドページ=====================

class FriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithDropDown(),
      body: Container(child: Center(child: Column(
        children: [
          RaisedButton(
          child:Text("フレンド申請一覧"),
            onPressed:()=>Navigator.push(context, MaterialPageRoute(builder: (context) => RequestedFriend())),
          ),
          friendListWidget(),
        ],
      ))),
    );
  }

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

class RequestedFriend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("フレンド申請一覧")),
        body:Column(
          children: [
            Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("申請を許可してフレンドになりましょう。"),
            )),
            FutureBuilder<QuerySnapshot>(   //SnapShotではないときはFutureBuilderとget()とfuture:
      // 投稿メッセージ一覧を取得（非同期処理）
      // 投稿日時でソート
              future: FirebaseFirestore.instance.collection("friendRequests").doc(uid).collection("requestFrom").orderBy("createdAt").get(),
              builder: (context, snapshot) {
                // データが取得できた場合
                if (snapshot.hasData) {
                  // 取得した投稿メッセージ一覧を元にリスト表示
                  return
                    Expanded(
                      child: ListView.builder(
                      shrinkWrap: true,
                        itemCount: snapshot.data.size,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot _card = snapshot.data
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
                                    return SimpleDialog(title: Center(child: Text("フレンド申請を許可しますか？")),
                                    children: [
                                      Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: new BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue, width: 2),
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image:
                                                    new AssetImage(
                                                        "lib/assets/user_icon1.jpg")))),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(_card['name'],style: TextStyle(fontSize: 20),),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            FlatButton(
                                              onPressed: () => Navigator.pop(context),
                                              child: Text("戻る"),
                                              color: Colors.grey.shade500,
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                acceptFriendRequest(_card);
                                                acceptFriendRequestCompleted(context,_card);

                                              },
                                              child: Text("許可する"),
                                              color: Colors.blue,),
                                          ],
                                        )
                                      ],
                                      )
                                    ]);});
                                },
                                child: Card(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          child: Stack(
                                            children: [
                                              FriendFaceIcon(userColor:Colors.blue),   //class:トプ画顔アイコン
                                              FriendAsobleIndicator(isFree:true)   //class:緑色インジケータ
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(bottom:4.0),
                                              child: Text(_card['name'],style: TextStyle(fontSize: 18),),
                                            ),
                                            Text(requestDate.year.toString() + "/" +
                                                requestDate.month.toString() + "/" +
                                                requestDate.day.toString() + "に申請されています。",style: TextStyle(fontSize:12,color: Colors.grey.shade600),),
                                          ],
                                        ), //ユーザーネーム
                                      ],
                                    )),
                              );
                          }else {
                            return Container(
                            child: Text("データが取得できませんでした。"),
                          );}
                        }),
                    );
                }


                // データが読込中の場合
                return Center(
                  child: Text('読込中...'),
                );}),

          ],
        ));
  }

  acceptFriendRequest(snapshot){

     try{
       var batch = db.batch();

       var myFriendsDoc = db.collection("friends").doc(uid).collection("friendsList").doc(snapshot.id);   //TODO friendslistまでは別で定義
       print(myFriendsDoc);
       var requestFromHimDoc = db.collection("friendRequests").doc(uid).collection("requestFrom").doc(snapshot.id);
       print(requestFromHimDoc);


       batch.set(myFriendsDoc, {
       "uid":snapshot.id,
       "name":snapshot["name"],
       "isFreeRef":"isFreeRef",//TODO isFreeRef
       "icon":"iconRef",
       "userInfoRef":"/users/${snapshot.id}",
     },);


       batch.delete(requestFromHimDoc);


       batch.commit().whenComplete(() => print("フレンド許可バッチ処理正常終了"));



     }catch(error){
       print(error);
     }

  }

  acceptFriendRequestCompleted(context,snapshot) {
    print("complete");
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (_) {
          return SimpleDialog(
            title: Center(child: Text("フレンド登録完了")),
            children: [
              Padding(
                padding: const EdgeInsets.only(left:32.0,right:32.0),
                child: Column(
                  children: [
                    Text("${snapshot["name"]}さんとフレンドになりました。"),
                    FlatButton(
                        onPressed: ()=>Navigator.pop(context),
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
