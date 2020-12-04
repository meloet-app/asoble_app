
import 'package:asoble_app/models/unique_event_model.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';


import 'event_comments_widget.dart';
import 'event_info_widget.dart';



class UniqueEventPage extends StatelessWidget {
  int index;
  String partyInfo;
  String partyName;

  UniqueEventPage({this.partyName, this.partyInfo, this.index});


  int selectedIndex=0;
  Color toggleInfoColor=Colors.lightBlueAccent;
  Color toggleCommentsColor= Colors.grey;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
            children: [
              Container(
                height: mediaSize.height - 85,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      pinned: true,
                      leading: Transform.scale(
                        scale: 0.9,
                        child: FloatingActionButton(
                          backgroundColor: Colors.lightBlue,
                          elevation: 0,
                          child: Icon(Icons.arrow_back_ios_outlined),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        stretchModes: <StretchMode>[StretchMode.zoomBackground],
                        centerTitle: true,
                        title: Text(partyName),
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image(
                              fit: BoxFit.fitWidth,
                              image: AssetImage('lib/assets/eventdemo1.jpeg'),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    colors: [
                                      Colors.white.withOpacity(0),
                                      Colors.lightBlue.withOpacity(0.9)
                                    ],
                                    stops: const [
                                      0.4,
                                      0.67,
                                    ],
                                  )),
                              constraints: BoxConstraints.expand(),
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: Colors.lightBlue,
                      expandedHeight: mediaSize.width * 9 / 16,
                    ),
                    SliverStickyHeader(
                        header: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                              child: Consumer<UniqueEventModel>(
                                  builder: (context, model, child) {
                                    return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      selectedIndex = 0;
                                      toggleInfoColor=Colors.lightBlueAccent;
                                      toggleCommentsColor=Colors.grey;
                                      model.changeUniqueEventPage(0);
                                    },
                                      child:Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),),
                                          color: toggleInfoColor,),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text("詳細情報"),
                                        ),
                                      )),
                                  GestureDetector(

                                    onTap: () {
                                      selectedIndex = 1;
                                      toggleCommentsColor=Colors.lightBlueAccent;
                                      toggleInfoColor=Colors.grey;
                                      model.changeUniqueEventPage(1);
                                    },
                                        child:Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10),),
                                            color: toggleCommentsColor,),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text("コメント"),
                                          ),
                                        )
                                  ),
                                  ],
                              );}
                              )),


                        sliver: Consumer<UniqueEventModel>(
                                builder: (context, model, child) {
                                  Widget selectedWidget;
                                model.selectedIndex == 0 ?
                                selectedWidget = EventInfoWidget()
                                :model.selectedIndex == 1 ?
                                selectedWidget = EventCommentsWidget()
                                :selectedWidget = Container();
                                model.clearUniqueEventIndex();
                                return selectedWidget;
                                })
                    )
                  ],
                ),
              ),

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
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Container(
                    child: RaisedButton(
                        color: Colors.lightBlue,
                        child: Container(
                            height: 40,
                            width: 100,
                            child: Center(child: Text("参加する"))),
                        onPressed: () => print("参加")),
                  ),
                ),
              ),
            ],
          ));


  }
}
