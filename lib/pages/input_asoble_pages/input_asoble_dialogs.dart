

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class InputAsobleTimeDialog extends StatelessWidget{




  @override
  Widget build(BuildContext context) {
    DateTime _dateTime = DateTime.now();
    final _ceilBaseNumber =10;

    var hourNow;
    var hourNowCeil;
    var minuteNow;
    var minuteNowCeil;
    minuteNow = _dateTime.minute;
    hourNow = _dateTime.hour;


    minuteNow = 56;

    minuteNowCeil = ((minuteNow/_ceilBaseNumber).ceil()*_ceilBaseNumber);
    print(minuteNowCeil.toString());
    if (minuteNowCeil == 60){
      minuteNowCeil = 0;
      hourNowCeil = hourNow+1;
    }
    return CupertinoAlertDialog(
      title: Text("いつまで遊べる？"),
      scrollController :ScrollController(),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            //            hourMinute12H(),
            hourMinute10Interval(),
//            hourMinuteSecond(),
//            hourMinute12HCustomStyle(),
            new Container(
              margin: EdgeInsets.symmetric(
                  vertical: 50
              ),
              child: new Text("〜"+
                  hourNowCeil.toString().padLeft(2, '0') + ':' +
                  (minuteNowCeil.toString().padLeft(2, '0')),
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
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
  }

  Widget hourMinute12H(){
    return new TimePickerSpinner(
      is24HourMode: false,
      onTimeChange: (time) {

      },
    );
  }
  Widget hourMinuteSecond(){
    return new TimePickerSpinner(
      isShowSeconds: true,
      onTimeChange: (time) {

      },
    );
  }
  Widget hourMinute10Interval(){
    return new TimePickerSpinner(
      spacing: 40,
      minutesInterval: 10,
      onTimeChange: (time) {

      },
    );
  }
  Widget hourMinute12HCustomStyle(){
    return new TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.deepOrange
      ),
      highlightedTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.yellow
      ),
      spacing: 50,
      itemHeight: 80,
      isForce2Digits: true,
      minutesInterval: 15,
      onTimeChange: (time) {

      },
    );
  }
}




//TODO 公開範囲設定（詳細）
class InputAsobleDisclosureRangeDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return

    //TODO ダイアログUIデザイン要検討
      CupertinoAlertDialog(

        title: Text("誰に公開する？"),
    scrollController :ScrollController(),
    content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlatButton(
              child:Text("全員"),
              onPressed: () =>null
          ),
          FlatButton(
              child:Text("コミュニティ1"),
              onPressed: () =>null
          ),
          FlatButton(
              child:Text("コミュニティ2"),
              onPressed: () =>null
          ),
          FlatButton(
              child:Text("コミュニティ3"),
              onPressed: () =>null
          ),
          FlatButton(
              child:Text("コミュニティ4"),
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
  }

}





