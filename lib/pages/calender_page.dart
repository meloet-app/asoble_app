import 'package:asoble_app/models/calender_model.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'navigation_bar/navigation_bar.dart';

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};

class CalenderPage extends StatefulWidget {
  CalenderPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  CalenderPageState createState() => CalenderPageState();
}

class CalenderPageState extends State<CalenderPage>
    with TickerProviderStateMixin {
  CalendarController _controller;
  DateTime selectedDay;

  CalendarFormat currentFormat;

  int toggleButtonIndex = 0;
  String toggleText = "絞り込む";

  Color selectedColor = Colors.blue;
  Color noSelectedColor = Colors.grey;

  Color tagEventColor = Colors.blue;
  Color tagFreeFriendColor = Colors.blue;
  Color tagMyFreeColor = Colors.grey;

  bool _calendarListVisible = false;
  bool _calendarSearchVisible = false;
  bool _calendarChoiceSortVisible = false;
  bool _eventVisible = true; //デフォルトtrueは？？
  bool _friendFreeVisible = false;
  bool _myFreeVisible = false;


  bool _myFreeActive = false;

  void _myFreeChangeSwitch(bool e) => setState(() => _myFreeActive = e);

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
    _controller = CalendarController();
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
    _controller.setSelectedDay(day);
  }

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
                  child: TableCalendar(
                    onDaySelected: onDaySelected,
                    availableGestures: AvailableGestures.horizontalSwipe,
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    locale: "ja-JP",
                    initialCalendarFormat: CalendarFormat.month,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: Colors.black),
                      weekendStyle: TextStyle(color: Colors.black),
                    ),
                    calendarStyle: CalendarStyle(
                        outsideDaysVisible: false,
                        todayColor: Colors.orange,
                        selectedColor: Theme.of(context).primaryColor,
                        todayStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white)),
                    headerStyle: HeaderStyle(
                        headerPadding: EdgeInsets.all(2.0),
                        centerHeaderTitle: true,
                        formatButtonVisible: false),
                    builders: CalendarBuilders(
                      dayBuilder: (context, date, events) => Stack(
                        children: [
                          Container(
                              margin: const EdgeInsets.all(1.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.black.withOpacity((0.4))),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        date.day.toString(),
                                      )))),
                          freeFriends.containsKey(
                                  DateTime(date.year, date.month, date.day))
                              ? Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 12,
                                      width: 12,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.white
                                                  .withOpacity((1))),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Color(0xff33CC10)),
                                    ),
                                  ),
                                )
                              : Container(),
                          eventList.containsKey(
                                  DateTime(date.year, date.month, date.day))
                              ? Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 12,
                                      width: 12,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color:
                                                Colors.white.withOpacity((1))),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ))
                              : Container()
                        ],
                      ),
                      selectedDayBuilder: (context, date, events) => Stack(
                        children: [
                          Container(
                              margin: const EdgeInsets.all(1.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: Colors.blue.withOpacity((0.7))),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Align(
                                  alignment: AlignmentDirectional.bottomStart,
                                  child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        date.day.toString(),
                                      )))),
                          freeFriends.containsKey(
                                  DateTime(date.year, date.month, date.day))
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.white.withOpacity((1))),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.green,
                                    ),
                                  ),
                                )
                              : Container(),
                          eventList.containsKey(
                                  DateTime(date.year, date.month, date.day))
                              ? Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 12,
                                      width: 12,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color:
                                                Colors.white.withOpacity((1))),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ))
                              : Container()
                        ],
                      ),
                      todayDayBuilder: (context, date, events) => Stack(
                        children: [
                          Container(
                              margin: const EdgeInsets.all(1.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: Colors.orange.withOpacity((0.7))),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        date.day.toString(),
                                      )))),
                          freeFriends.containsKey(
                                  DateTime(date.year, date.month, date.day))
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.white.withOpacity((1))),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.green,
                                    ),
                                  ),
                                )
                              : Container(),
                          eventList.containsKey(
                                  DateTime(date.year, date.month, date.day))
                              ? Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 12,
                                      width: 12,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color:
                                                Colors.white.withOpacity((1))),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ))
                              : Container()
                        ],
                      ),
                    ),
                    calendarController: _controller,
                  ),
                ),
              ),

              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: RaisedButton(
                      child: Text(toggleText),
                      onPressed: () {
                        setState(() {
                          toggleButtonIndex == 0
                              ? toggleButtonIndex = 1
                              : toggleButtonIndex = 0;
                          switch (toggleButtonIndex) {
                            case 0:
                              toggleText = "絞り込む";
                              _calendarListVisible = false;
                              _controller
                                  .setCalendarFormat(CalendarFormat.month);
                              break;
                            case 1:
                              toggleText = "一覧を隠す";
                              _calendarListVisible = true;
                              _controller
                                  .setCalendarFormat(CalendarFormat.week);
                              break;
                          }
                        });
                      },
                    ),
                  ),
                  Visibility(
                      visible: _calendarListVisible,
                      child: Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.blue,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.storage,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (_calendarChoiceSortVisible ==
                                            true) {
                                          _calendarChoiceSortVisible = false;
                                        } else if (_calendarChoiceSortVisible ==
                                            false) {
                                          if(_calendarSearchVisible==true) {
                                            _calendarSearchVisible=false;
                                          }
                                          _calendarChoiceSortVisible = true;
                                        }
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.blue,
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (_calendarSearchVisible == true) {
                                            _calendarSearchVisible = false;
                                          } else if (_calendarSearchVisible ==
                                              false) {
                                            if(_calendarChoiceSortVisible==true) {
                                              _calendarChoiceSortVisible=false;
                                            }
                                            _calendarSearchVisible = true;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))),
                ],
              ),


              Visibility(
                visible: _calendarListVisible,
                child: Column(
                  children: [
                    Visibility(
                        visible: _calendarSearchVisible,
                        child: Container(
                          width: mediaSize.width * 0.9,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print(value);
                              },
                              // 追加
                              decoration: InputDecoration(
                                labelText: "検索するワードを入力",
                                border: OutlineInputBorder(),
                              ),
                              textInputAction: TextInputAction.done,
                              enabled: true,
                              // 入力数
                              maxLengthEnforced: false,
                              obscureText: false,
                              maxLines: 1,
                              //パスワード
                              onChanged: null,
                            ),
                          ),
                        )),
                    Visibility(
                      visible: _calendarChoiceSortVisible,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: mediaSize.width * 0.9,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    RaisedButton(
                                      child: Text("イベント"),
                                      color: tagEventColor,
                                      onPressed: () {
                                        setState(() {
                                          if (_eventVisible == true) {
                                            _eventVisible = false;
                                            tagEventColor = noSelectedColor;
                                          } else if (_eventVisible == false) {
                                            _eventVisible = true;
                                            tagEventColor = selectedColor;
                                          }
                                        });
                                      },
                                    ),
                                    RaisedButton(
                                      child: Text("ヒマな友達"),
                                      color: tagFreeFriendColor,
                                      onPressed: () {
                                        setState(() {
                                          if (_friendFreeVisible == true) {
                                            _friendFreeVisible = false;
                                            tagFreeFriendColor = noSelectedColor;
                                          } else if (_friendFreeVisible == false) {
                                            _friendFreeVisible = true;
                                            tagFreeFriendColor = selectedColor;
                                          }
                                        });
                                      },
                                    ),

                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                       Text("自分が遊べる日だけ表示する"),
                                  Switch(
                                      value: _myFreeActive,
                                      activeColor: Colors.blue,
                                      activeTrackColor: Colors.blueAccent,
                                      inactiveThumbColor: Colors.grey,
                                      inactiveTrackColor: Colors.grey,
                                      onChanged: _myFreeChangeSwitch,

                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
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
                    CalenderPageState()
                        .ChangeSelectedDay(day.add(Duration(days: -1)));
                  });
                }),
            Text(DateFormat.yMMMd('ja').format(day)),
            IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  setState(() {
                    day = day.add(Duration(days: 1));
                    CalenderPageState()
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
