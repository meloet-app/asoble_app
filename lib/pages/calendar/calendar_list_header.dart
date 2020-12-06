

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendar_page.dart';

class CalendarListHeader extends StatefulWidget{
  @override
  _CalendarListHeaderState createState() => _CalendarListHeaderState();
}

class _CalendarListHeaderState extends State<CalendarListHeader> {

  bool _calendarSearchVisible = false;
  bool _calendarChoiceSortVisible = false;


  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: RaisedButton(
              child: Text(CalendarPageState().toggleText),
              onPressed: () {
                setState(() {
                  CalendarPageState().toggleButtonIndex == 0
                      ? CalendarPageState().toggleButtonIndex = 1
                      : CalendarPageState().toggleButtonIndex = 0;
                  switch (CalendarPageState().toggleButtonIndex) {
                    case 0:
                      CalendarPageState().toggleText = "絞り込む";
                      CalendarPageState().calendarListVisible = false;
                      CalendarPageState().controller
                          .setCalendarFormat(CalendarFormat.month);
                      break;
                    case 1:
                      CalendarPageState().toggleText = "一覧を隠す";
                      CalendarPageState().calendarListVisible = true;
                      CalendarPageState().controller
                          .setCalendarFormat(CalendarFormat.week);
                      break;
                  }
                });
              },
            ),
          ),
          Visibility(
              visible: CalendarPageState().calendarListVisible,
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
      );

  }
}