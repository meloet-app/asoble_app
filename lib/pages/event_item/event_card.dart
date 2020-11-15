import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {


  String eventName;
  String time;
  int index;
  EventCard({this.eventName,this.time,this.index});

  Color indicatorColor = const Color(0xff33CC10);

  @override
  Widget build(BuildContext context) {
    return
      Row(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height:mediaSize.height*0.15+16.0,
                width:mediaSize.width*0.25 ,


                child:Center(child: Text(time))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              Center(
                child: new GestureDetector(
                  child: Card(
                    child: Container(
                        width: mediaSize.width*0.6,
                        height: mediaSize.height*0.15,


                        child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text(eventName,style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(time),
                            ])



                    ),
                  ),
                ),
              ),
            )
          ]);
  }
}
