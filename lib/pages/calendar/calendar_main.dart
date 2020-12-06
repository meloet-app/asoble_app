

import 'package:asoble_app/pages/calendar/calendar_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      TableCalendar(
        onDaySelected: CalendarPageState().onDaySelected,
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
        calendarController: CalendarPageState().controller,
      );
  }

}