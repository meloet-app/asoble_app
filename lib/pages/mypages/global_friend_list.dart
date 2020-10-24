
import 'package:asoble_app/pages/setup/welcome.dart';
import 'package:flutter/material.dart';





class GlobalFriendListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Container(

                width: mediaSize.width,
                height: mediaSize.height * 0.15,
                color: Colors.white70,
                child: Center(child: Text("TAG")),

              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int i) {
                        if (i.isOdd) return Divider();
                        final index = i ~/ 2;
                        if (index < 12) {
                          return new Card(
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 6, top: 6, right: 12, bottom: 6),
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.green, width: 2),
                                        borderRadius: BorderRadius.circular(60)
                                    ),
                                  ),
                                  Text("名無し太郎その" + index.toString()),
                                ],
                              )
                          );
                        }else{return null;}
                        }
                        )
                    ),


            ],
          )
      );
  }


}