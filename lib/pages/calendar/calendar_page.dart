import 'package:asoble_app/models/calender_model.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'calendar_main.dart';
import '../navigation_bar/navigation_bar.dart';


// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};

//=======================カレンダーページ ==========================

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {

  //---------------変数定義----------------------
  CalendarController controller;
  DateTime selectedDay;

  CalendarFormat currentFormat;

  int toggleButtonIndex = 0;
  String toggleText = "絞り込む";





  bool calendarListVisible = false;





  //---------------変数定義 以上----------------------

  //---------------メソッド定義----------------------


  Widget freeFriendsCalendarListWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListTile(
          tileColor: Colors.grey.shade200,
          leading: Icon(Icons.group),
          title: Text("〇〇人がこの日遊びたがっています。"),
          trailing: RaisedButton(onPressed: () => null, child: Text("詳細"))),
    );
  }

  Widget eventCalendarListWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListTile(
          tileColor: Colors.grey.shade200,
          leading: Icon(Icons.nightlife),
          title: Text("イベントタイトル"),
          trailing: RaisedButton(onPressed: () => null, child: Text("詳細"))),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = CalendarController();
    DateTime _selectedDay = DateTime.now(); //
  }



  @override
  onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelectedcd ');

    if (selectedDay == day) {
      CalendarDialogModel().onCalendarCellTap(day);
      return showDialog(
        context: context,
        builder: (_) {
          return DayEventDialog(
            day: day,
            context: context,
          );
        },
      );
    } else {
      selectedDay = day;
    }
  }


  ChangeSelectedDay(day) {
    controller.setSelectedDay(day);
  }

  //-------------------------メソッド定義　以上--------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarWithDropDown(context),
        body:SingleChildScrollView(
        child:
        Consumer<CalendarDialogModel>(builder: (context, model, child) {
          return Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: MainCalendar(),
                ),
              ),




              Visibility(
                visible: calendarListVisible,
                child: Column(
                  children: [

                    ListView(
                      shrinkWrap: true, //heightの無制限化阻止
                      children: [
                        freeFriendsCalendarListWidget(),
                        eventCalendarListWidget()
                      ],
                    ),
                  ],
                ),
              ),

              //_controller.setSelectedDay(day)で選択する日付の変更
            ],
          );
        })));
  }
}

//=======================カレンダーページ 以上==========================


class DayEventDialog extends StatefulWidget {
  DateTime day;
  BuildContext context;

  DayEventDialog({this.day, this.context});

  @override
  DayEventDialogState createState() =>
      DayEventDialogState(day: day, context: context);
}


class DayEventDialogState extends State<DayEventDialog> {
  BuildContext context;
  DateTime day;

  DayEventDialogState({this.day, this.context});

  var formatter = new DateFormat('H:mm', "ja_JP");

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarDialogModel>(builder: (context, model, child) {
      return SimpleDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  setState(() {
                    day = day.add(Duration(days: -1));
                    CalendarPageState()
                        .ChangeSelectedDay(day.add(Duration(days: -1)));
                  });
                }),
            Text(DateFormat.yMMMd('ja').format(day)),
            IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  setState(() {
                    day = day.add(Duration(days: 1));
                    CalendarPageState()
                        .ChangeSelectedDay(day.add(Duration(days: 1)));
                  });
                }),
          ],
        ),
        children: [
          Column(
            children: [
              eventList.containsKey(DateTime(day.year, day.month, day.day))
                  ? Row(
                      children: [
                        Text(eventList[DateTime(day.year, day.month, day.day)]
                            ["name"]),
                        Text(formatter.format(eventList[
                                    DateTime(day.year, day.month, day.day)]
                                ["start"]) +
                            "〜" +
                            formatter.format(eventList[
                                DateTime(day.year, day.month, day.day)]["end"]))
                      ],
                    )
                  : Text("イベントありません"),
              freeFriends.containsKey(DateTime(day.year, day.month, day.day))
                  ? Row(
                      children: [
                        Text(freeFriends[DateTime(day.year, day.month, day.day)]
                            ["name"]),
                        Text(formatter.format(freeFriends[
                                    DateTime(day.year, day.month, day.day)]
                                ["start"]) +
                            "〜" +
                            formatter.format(freeFriends[
                                DateTime(day.year, day.month, day.day)]["end"]))
                      ],
                    )
                  : Text("フレンドがいません"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                child: Text("戻る"),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                child: Text("書き込む"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ],
      );
    });
  }
}



//---------------------------テスト-------------------------------

List<String> ifCalenderList = [
  "一番遊べる人数が多い日",
  "自分が遊べる日の中で一番遊べる人数が多い日",
  "一番イベントが人気の日",
];

List<dynamic> selectedEvent = [];

List<dynamic> EventName_No1 = [
  DateTime(2020, 11, 11, 18, 00),
  "EventName No.1",
  "山田太郎"
];

List<dynamic> EventName_No2 = [
  DateTime(2020, 11, 26, 15, 00),
  "EventName No.2",
  "加藤花子",
];

Map<DateTime, dynamic> freeFriends = {
  DateTime(2020, 11, 3): {
    "name": "ぱぴよん",
    "start": DateTime(2020, 11, 3, 12, 00),
    "end": DateTime(2020, 11, 16, 15, 30)
  },
  DateTime(2020, 11, 3): {
    "name": "ぱぴよん",
    "start": DateTime(2020, 11, 3, 12, 00),
    "end": DateTime(2020, 11, 16, 15, 30)
  },
  DateTime(2020, 11, 16): {
    "name": "加藤Taka",
    "start": DateTime(2020, 11, 16, 15, 00),
    "end": DateTime(2020, 11, 16, 18, 30)
  },
  DateTime(2020, 11, 20): {
    "name": "国宗義晴",
    "start": DateTime(2020, 11, 20, 9, 00),
    "end": DateTime(2020, 11, 16, 12, 30)
  },
  DateTime(2020, 11, 30): {
    "name": "欽ちゃん",
    "start": DateTime(2020, 11, 30, 15, 00),
    "end": DateTime(2020, 11, 16, 18, 30)
  }
};

Map<DateTime, dynamic> eventList = {
  DateTime(2020, 11, 4): {
    "name": "飲み会in錦糸町！",
    "start": DateTime(2020, 11, 4, 18, 00),
    "end": DateTime(2020, 11, 4, 22, 00)
  },
  DateTime(2020, 11, 30): {
    "name": "神イベ",
    "start": DateTime(2020, 11, 30, 12, 00),
    "end": DateTime(2020, 11, 30, 18, 30)
  },
};
