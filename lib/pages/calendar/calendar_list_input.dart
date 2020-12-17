

import 'package:asoble_app/pages/calendar/calendar_page.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../login_check.dart';

class CalendarListInput extends StatefulWidget{
  @override
  _CalendarListInputState createState() => _CalendarListInputState();
}

class _CalendarListInputState extends State<CalendarListInput> {

  bool _calendarSearchVisible = false;
  bool _calendarChoiceSortVisible = false;

  Color selectedColor = Colors.blue;
  Color noSelectedColor = Colors.grey;

  Color tagEventColor = Colors.blue;
  Color tagFreeFriendColor = Colors.blue;
  Color tagMyFreeColor = Colors.grey;

  bool _eventVisible = true; //デフォルトtrueは？？
  bool _friendFreeVisible = false;
  bool _myFreeVisible = false;
  bool _myFreeActive = false;

  void _myFreeChangeSwitch(bool e) => setState(() => _myFreeActive = e);

  @override
  Widget build(BuildContext context) {
return Column(
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

  ],
);

  }
}