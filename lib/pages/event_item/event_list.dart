import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentPartyListWidget extends StatelessWidget {
  String partyName;
  String partyInfo;
  int index;
  CurrentPartyListWidget({this.partyName, this.partyInfo,this.index});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: mediaSize.width*0.9,
      height: mediaSize.height*0.12,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 28.0),
        child: GestureDetector(
          onTap: () {

          },
          child: Card(
              elevation: 10,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      partyName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(partyInfo),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}



List<Widget> currentPartyList = [
  CurrentPartyListWidget(partyName: "ZOOM飲み！！！", partyInfo: "夜７時から",index:10),
  CurrentPartyListWidget(partyName: "有楽町でしっぽり！！！", partyInfo: "夜９時から",index:11),
  CurrentPartyListWidget(partyName: "歌舞伎町でバチコり！！！", partyInfo: "夜１０時から",index:12),
  CurrentPartyListWidget(partyName: "多摩センターでゲロのみ！！！", partyInfo: "夜１０時から",index:13),
];
