import 'package:asoble_app/firebase_var.dart';
import 'package:asoble_app/login_check.dart';
import 'package:asoble_app/models/clip_board_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RequestFriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("友達を追加"),
        ),
        body: Container(
            child: Column(
          children: [
            Container(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("IDで申請する"),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddFriendIDPage())),
                ),
                RaisedButton(
                  child: Text("LINEで招待する"),
                  onPressed: () => null,
                ),
              ],
            )
          ],
        )));
  }
}

class AddFriendIDPage extends StatelessWidget {
  TextEditingController textEditingController = new TextEditingController();
  String friendID;

  var hasDataFlag;

  @override
  Widget build(BuildContext context) {
    final _clipboardState =
        Provider.of<GetClipBoardModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("IDで追加"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            _clipboardState.clear();
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          width: mediaSize.width * 0.9,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: mediaSize.width * 0.7,
                      child: Consumer<GetClipBoardModel>(
                          builder: (context, model, child) {
                        textEditingController.text = model.clipStrings;
                        return Container(
                          child: TextField(
                            controller: textEditingController,
                            enabled: true,
                            // 入力数
                            maxLength: 28,
                            maxLengthEnforced: false,
                            style: TextStyle(color: Colors.black),
                            obscureText: false,
                            maxLines: 1,
                            decoration: InputDecoration(
                              icon: Icon(Icons.person_add),
                              hintText: 'フレンドIDを入力してください',
                              labelText: 'フレンドID',
                            ),
                          ),
                        );
                      })),
                  IconButton(
                    icon: Icon(
                      Icons.paste_outlined,
                    ),
                    onPressed: () {
                      _clipboardState.getClipBoardText();
                    },
                    iconSize: 20,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:24.0),
                child: RaisedButton(
                  child: Text("決定"),
                  onPressed: () async {
                    friendID = textEditingController.text;
                    if(friendID== ""){
                    showFindErrorDialog(context);
                    }else if(friendID.length < 28){
                    showFindErrorDialog(context);
                    }else if(friendID==uid){
                    showMyIDErrorDialog(context);
                    }else {
                      await friendRequestConfirm(friendID, context);}
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,top:48,right:8.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.lightBlue,width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:16.0),
                    child: Center(child: Text("自分のID")),
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(uid),
                      IconButton(
                        icon: Icon(Icons.copy),
                        onPressed:()=>getCopy(),
                      )
                ],
              )
                ],
              ))

              )],
          ),
        ),
      ),
    );
  }

  void getCopy() async {
    final copy = ClipboardData(text: uid);
    await Clipboard.setData(copy);
  }

  friendRequestConfirm(String friendID, BuildContext context) {

    showDialog(
        context: context,
        builder: (_) {

              return SimpleDialog(title: Text("フレンド申請"),
                children: [
                FutureBuilder<DocumentSnapshot>(
                    //SnapShotではないときはFutureBuilderとget()とfuture:
                    // 投稿メッセージ一覧を取得（非同期処理）
                    // 投稿日時でソート
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(friendID).get(),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                        // データが取得できた場合
                      if  (snapshot.hasData) {
                        DocumentSnapshot _card = snapshot.data;

                       var friendName =_card["name"];
                          // 取得した投稿メッセージ一覧を元にリスト表示
                          return Column(
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
                                child: Text(friendName,style: TextStyle(fontSize: 20),),
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
                                        friendRequest(friendID,context,_card);
                                    },
                                    child: Text("申請する"),
                                    color: Colors.blue,),
                                ],
                              )
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return showFindErrorDialog(context);
                        }
                        // データが読込中の場合
                        return Center(child:
                        CircularProgressIndicator());
                      }
                )],);
            }
          );
        }

  }




  Future<void> friendRequest(String friendID, BuildContext context,DocumentSnapshot snapshot) async {

    DateTime now = DateTime.now().toLocal(); // 現在の日時


    final requestToDoc = FirebaseFirestore.instance
        .collection('friendRequests') // コレクションID指定
        .doc(uid) // ドキュメントID自動生成
        .collection("requestTo")
        .doc(friendID);

      try {

          final requestTo = await requestToDoc.get();

          if(requestTo.exists) {
            print("申請済み");

            showAlreadyRequested(context,snapshot);
          }else{
            requestToDoc.set({
              'friendID': friendID,
              'name': snapshot["name"],
              'status': 0, //0:未承認,1:承認済み,2:拒否
              'createdAt': now
            });
            showRequestFriendCompleted(context,snapshot);
          }
        GetClipBoardModel().clear();

      } catch (error) {
        print(error);
      }
  }

  showFindErrorDialog(context) {
    return showDialog(
        context: context,
        builder: (_) {
          return SimpleDialog(
            title: Center(child: Text("フレンドIDを\n正しく入力してください。")),
            children: [
              Padding(
                padding: const EdgeInsets.only(left:32.0,right:32.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children:[
                Row(
                  children: [
                    Icon(Icons.paste_outlined,),
                    Text("を押すことで、クリップボードに"),
                  ],
                ),
                Text("コピーしたユーザIDを\n貼り付けることができます。"),
                FlatButton(
                    onPressed: ()=>Navigator.pop(context),
                    child: Center(child: Text("戻る"))
                ),
            ]),
              ),]
          );
        });
  }

  showRequestErrorDialog(context) {

   return  showDialog(
        context: context,
        builder: (_) {
          return SimpleDialog(
            title: Center(child: Text("通信に失敗しました。")),
            children: [
              Padding(
                padding: const EdgeInsets.only(left:32.0,right:32.0),
                child: Column(
                  children: [
                    Text("時間を開けてもう一度お試しください"),
                FlatButton(
                    onPressed: ()=>Navigator.pop(context),
                    child: Text("戻る")
                ),
                  ],
                ),
              ),
            ],
          );
        });
  }

showRequestFriendCompleted(context,snapshot) {
  Navigator.pop(context);
  showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Center(child: Text("フレンド申請完了")),
          children: [
            Padding(
              padding: const EdgeInsets.only(left:32.0,right:32.0),
              child: Column(
                children: [
                  Text("${snapshot["name"]}さんにフレンド申請を送りました。"),
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

showAlreadyRequested(context,snapshot) {
  Navigator.pop(context);
  showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Center(child: Text("フレンド申請済み")),
          children: [
            Padding(
              padding: const EdgeInsets.only(left:32.0,right:32.0),
              child: Column(
                children: [
                  Text("${snapshot["name"]}さんにはすでにフレンド申請が済んでいます。"),
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


  showMyIDErrorDialog(context) {
    return  showDialog(
        context: context,
        builder: (_) {
          return SimpleDialog(
            title: Center(child: Text("自分のIDは検索できません")),
            children: [
              Padding(
                padding: const EdgeInsets.only(left:32.0,right:32.0),
                child: Column(
                  children: [
                    Text("友達に招待を送るか、\nIDを教えてもらいましょう。"),
                FlatButton(
                    onPressed: ()=>Navigator.pop(context),
                    child: Text("戻る")
                ),
                  ],
                ),
              ),
            ],
          );
        });
  }
