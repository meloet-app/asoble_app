import 'package:asoble_app/pages/mypages/in_community/community_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalCommunityListPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
        appBar: AppBar(),
        body: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(

                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (BuildContext context, int i) {
                    if (i.isOdd) return Divider();
                    final index = i ~/ 2;
                    if (index < 4) {
                    return Container(
                      height:120,
                      child: GestureDetector(
                        onTap:(){ Navigator.push(context, CupertinoPageRoute(builder: (context) => CommunityHomePage()));},
                        child: new Card(
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
                           Text("コミュニティ" + index.toString()),
                        ],
                        )
                        ),
                      ),
                    );}else{return null;}
                    }
    ),
                )
              ],
            ))
      );
  }
}