import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../firebase_var.dart';
import '../login_check.dart';


class DataBaseTestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child:Icon(Icons.offline_bolt)
              ,onPressed: (){
            FirebaseAuth.instance.signOut().then((result)=>print("Signed Out"));
              },
      ),
        body: Container(
            child: Center(
              child: Container(

                child: Column(
                  children: [
        Container(
          height:mediaSize.height*0.6,
          child: StreamBuilder<QuerySnapshot>(   //SnapShotではないときはFutureBuilderとget()とfuture:
          // 投稿メッセージ一覧を取得（非同期処理）
          // 投稿日時でソート
          stream: FirebaseFirestore.instance
              .collection('users')
              .snapshots(),
          builder: (context, snapshot) {
            // データが取得できた場合
            if (snapshot.hasData) {
              final List<DocumentSnapshot> documents =
                  snapshot.data.docs;
              // 取得した投稿メッセージ一覧を元にリスト表示
              return ListView(
                shrinkWrap: true,
                children: documents.map((document) {
                  return Card(
                    child: ListTile(
                      title: Text(document['name']),
                      subtitle: Text(document['isFree']?"遊びたい！":"今はちょっと..."),
                    ),
                  );
                }).toList(),
              );
            }


            // データが読込中の場合
            return Center(
              child: Text('読込中...'),
            );}),
        ),
                  RaisedButton(
                    child: Text("BACK"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                  ],
                ),
              ),
            )
        ));
  }


}
