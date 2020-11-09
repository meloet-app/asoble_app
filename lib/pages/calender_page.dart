

import 'package:asoble_app/models/calender_model.dart';
import 'package:asoble_app/models/select_community_model.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class CalenderPageState extends State<CalenderPage> with TickerProviderStateMixin {
  CalendarController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithDropDown(),
      body:
          Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TableCalendar(
                      rowHeight: 76,
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      locale: "ja-JP",
                      initialCalendarFormat: CalendarFormat.month,
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: Colors.black),
                        weekendStyle: TextStyle(color: Colors.black),
                      ),

                      calendarStyle: CalendarStyle(

                          todayColor: Colors.orange,
                          selectedColor: Theme.of(context).primaryColor,
                          todayStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white)),
                        headerStyle: HeaderStyle(
                        centerHeaderTitle: true,
                        formatButtonVisible: false
                      ),

                      builders: CalendarBuilders(
                        outsideDayBuilder:  (context, date, events) => Container(
                            margin: const EdgeInsets.all(1.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Colors.grey.withOpacity(0.8)),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child:Text(
                                      date.day.toString(),
                                      style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                                    )))),
                        outsideWeekendDayBuilder:  (context, date, events) => Container(
                            margin: const EdgeInsets.all(1.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Colors.grey.withOpacity(0.8)),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child:Text(
                                      date.day.toString(),style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                                    )))),
                        dayBuilder: (context, date, events) => Container(
                            margin: const EdgeInsets.all(1.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child:Text(
                              date.day.toString(),
                            )))),
                        selectedDayBuilder: (context, date, events) => Container(
                            margin: const EdgeInsets.all(2.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: Theme.of(context).primaryColor,width: 2),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  date.day.toString(),
                                ),
                              ),
                            )),
                        todayDayBuilder: (context, date, events) => Container(
                            margin: const EdgeInsets.all(2.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange,width: 2),

                                borderRadius: BorderRadius.circular(10.0)),
                            child: Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child:Text(
                              date.day.toString(),

                            )))),
                      ),
                      calendarController: _controller,
                    ),


              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:24.0),
                  child: Consumer<SelectIfCalenderModel>(
                      builder: (context, model, child) {
                        return Padding(
                          padding: const EdgeInsets.only(left:40.0),
                          child: Container(

                            child: DropdownButton<String>(
                              underline:  Container(
                                height: 0,
                                color: Colors.black,
                              ),
                              iconEnabledColor: Colors.black,
                              iconSize:40,
                              autofocus: true,

                              value: ifCalenderList[model.selectedIfCalenderIndex],
                              onChanged:(String newValue){
                                model.changeIfCalender(newValue);
                              },
                              selectedItemBuilder: (context) {
                                return ifCalenderList.map((String item) {
                                  return Center(
                                    child: Container(
                                      width: 160,


                                      child: Text(
                                        item,
                                        style: TextStyle(color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,

                                      ),

                                    ),
                                  );
                                }).toList();
                              },
                              items: ifCalenderList.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: item == ifCalenderList[model.selectedIfCalenderIndex]
                                        ? TextStyle(fontWeight: FontWeight.bold)
                                        : TextStyle(fontWeight: FontWeight.normal),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        );

                      }
                      ),
                ),
              )

                  ],
                ),
              ),
            ],
          ),


    );
  }
}

List<String> ifCalenderList=[
  "一番遊べる人数が多い日",
  "自分が遊べる日の中で一番遊べる人数が多い日",
  "一番イベントが人気の日",
];

