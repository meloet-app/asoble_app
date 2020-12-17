


import 'package:asoble_app/models/input_asoble_info_model.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../login_check.dart';
import 'input_asoble_dialogs.dart';

class notify_Asoble extends StatelessWidget {

  List<String> locateHistory=["新宿駅","有楽町駅","秋葉原","吉祥寺","渋谷"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: new Consumer<InputAsobleInfoModel>(
          builder: (context, model, child) {
            return
              SafeArea(
                child: Container(
                  constraints: BoxConstraints(),
                  child: Stack(children:[
                    Align(alignment: AlignmentDirectional.topCenter,
                      child: Column(
                          children: [
                            Text("asoble情報"),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("いつまで遊べますか？"),
                            ),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.4),
                                      border: Border.all(color:Colors.blue,width:2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  width:120,
                                  height: 35,
                                      child: Container(

                                        child:
                                            FlatButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {

                                                      //TODO もっと前の履歴ボタン作る
                                                      return InputAsobleTimeDialog();
                                                    },
                                                  );
                                                },
                                                child:
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Text("〜19:00"),
                                                Icon(Icons.keyboard_arrow_down)
                                              ],
                                            )
                                            ),


                                      ),),

                            Padding(
                                padding: const EdgeInsets.all(8.0),

                                child: Container(
                                  height:100,

                                  child:

                                      Container(
                                        width:mediaSize.width*0.9,
                                        child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children:[
                                              FreeTimeButton(howHour:1.0),
                                              FreeTimeButton(howHour:1.5),
                                              FreeTimeButton(howHour:2.0),
                                              FreeTimeButton(howHour:2.5),
                                              FreeTimeButton(howHour:3.0),
                                              FreeTimeButton(howHour:3.5),
                                              FreeTimeButton(howHour:4.0),
                                              FreeTimeButton(howHour:4.5),
                                              FreeTimeButton(howHour:5.0),
                                            ]
                                        ),
                                      ),

                                  ),
                                ),


                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("今どこにいますか？"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: mediaSize.width*0.9,
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        width:mediaSize.width*0.7,
                                        child: TextField(
                                          enabled: true,
                                          // 入力数
                                          maxLength: 25,
                                          maxLengthEnforced: false,
                                          style: TextStyle(color: Colors.red),
                                          obscureText: false,
                                          maxLines:1 ,
                                          //パスワード
                                          onChanged: null,
                                        ),
                                      ),

                                    Container(
                                      width:60,
                                      child: FlatButton(
                                        color: Colors.blue.withOpacity(0.4),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {

                                              //TODO もっと前の履歴ボタン作る
                                              return CupertinoAlertDialog(
                                                title: Text("登録場所の履歴"),
                                                scrollController :ScrollController(),
                                                content: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                     FlatButton(
                                                        child:Text(locateHistory[0]),
                                                        onPressed: () =>null
                                                    ),
                                                    FlatButton(
                                                        child:Text(locateHistory[1]),
                                                        onPressed: () =>null
                                                    ),
                                                    FlatButton(
                                                        child:Text(locateHistory[2]),
                                                        onPressed: () =>null
                                                    ),
                                                    FlatButton(
                                                        child:Text(locateHistory[3]),
                                                        onPressed: () =>null
                                                    ),
                                                    FlatButton(
                                                        child:Text(locateHistory[4]),
                                                        onPressed: () =>null
                                                    ),

                                                  ]),



                                                actions: <Widget>[
                                                  CupertinoDialogAction(
                                                    child: Text("Delete"),
                                                    isDestructiveAction: true,
                                                    onPressed: () => Navigator.pop(context),
                                                  ),
                                                  CupertinoDialogAction(
                                                    child: Text("OK"),
                                                    onPressed: () => Navigator.pop(context),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child:
                                        Icon(Icons.history),

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("公開範囲を指定して下さい"),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.4),
                                border: Border.all(color:Colors.blue,width:2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width:mediaSize.width*0.6,
                              height: 35,
                              child: Container(

                                child:
                                FlatButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {

                                          //TODO もっと前の履歴ボタン作る
                                          return InputAsobleDisclosureRangeDialog();
                                        },
                                      );
                                    },
                                    child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("コミュニティ１"),
                                        Icon(Icons.keyboard_arrow_down)
                                      ],
                                    )
                                ),


                              ),),


                    ])),
                        Align(
                          alignment:AlignmentDirectional.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Row(

                              mainAxisAlignment:MainAxisAlignment.spaceAround,
                              children:[
                                // ボタン領域
                                RaisedButton(
                                  child: Text("やめる"),
                                  onPressed: () {
                                    model.clearInputAsobleDialog();
                                    Navigator.pop(context);
                                  },
                                ),
                                RaisedButton(
                                  child: Text("これで登録する"),
                                  onPressed: () {
                                    model.clearInputAsobleDialog();
                                    Navigator.pop(context);
                                  },
                            ),
                          ],
                        ),
                      ),
                    )]

                  ),
              ),
                );}),
    );
  }
}




class FreeTimeButton extends StatelessWidget{
  double howHour;
  FreeTimeButton({this.howHour});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(70)),
          child:Container(
              width:70,
              height:70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.2),
              ),
              child: FlatButton(
                onPressed: ()=> null ,
                child: Center(child: Text(howHour.toString()+"h",)

                ),
              )),
        ),
      );
  }
}

