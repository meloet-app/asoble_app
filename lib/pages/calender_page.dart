
import 'package:asoble_app/models/calender_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class CalenderPageState extends State<CalenderPage> with TickerProviderStateMixin {
  CalendarController _controller;
  DateTime wkPreviousDay;

  @override
  void initState() {

    super.initState();
    _controller = CalendarController();
    DateTime _selectedDay = DateTime.now();
  }

  @override
  onDaySelected(DateTime day, List events, List holidays) {

    print('CALLBACK: _onDaySelectedcd ');


      if (wkPreviousDay == day){


         return showDialog(context: context,builder: (_) {return DayEventDialog(context,day);}, );
      }else{

          wkPreviousDay = day;

    };
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

                      onDaySelected:onDaySelected,
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
                        centerHeaderTitle: true,
                        formatButtonVisible: false
                      ),
                      builders: CalendarBuilders(


                        dayBuilder: (context, date, events) => Stack(
                          children: [
                            Container(
                                margin: const EdgeInsets.all(1.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(

                                    border: Border.all(width: 1,color: Colors.black.withOpacity((0.4))),
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child:Text(
                                  date.day.toString(),
                                )))),


                            freeFriends.containsKey(DateTime(date.year,date.month,date.day)) ?  Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 16,
                                  width: 16,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1,color: Colors.white.withOpacity((1))),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xff33CC10)),
                                ),
                              ),
                            ):
                                Container(),

                            eventList.containsKey(DateTime(date.year,date.month,date.day))? Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(Icons.nightlife,size: 20,),
                                )):Container()
                          ],
                        ),


                        selectedDayBuilder: (context, date, events) => Stack(
                          children: [
                            Container(
                                margin: const EdgeInsets.all(1.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(

                                    border: Border.all(width: 2,color: Colors.blue.withOpacity((0.7))),
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child:Text(
                                          date.day.toString(),
                                        )))),


                            freeFriends.containsKey(DateTime(date.year,date.month,date.day)) ?  Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.white.withOpacity((1))),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.green,),
                              ),
                            ):
                            Container(),

                            eventList.containsKey(DateTime(date.year,date.month,date.day))? Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(Icons.nightlife,size: 20,),
                                )):Container()
                          ],
                        ),


                        todayDayBuilder: (context, date, events) => Stack(
                          children: [
                            Container(
                                margin: const EdgeInsets.all(1.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(

                                    border: Border.all(width: 2,color: Colors.orange.withOpacity((0.7))),
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child:Text(
                                          date.day.toString(),
                                        )))),


                            freeFriends.containsKey(DateTime(date.year,date.month,date.day)) ?  Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.white.withOpacity((1))),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.green,),
                              ),):Container(),


                            eventList.containsKey(DateTime(date.year,date.month,date.day))? Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(Icons.nightlife,size: 20,),
                                )):Container()
                          ],


                        ),

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
                                      width: 200,
                                      child: Text(
                                        item,
                                        style: TextStyle(color: Colors.black,
                                            ),
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


  Widget DayEventDialog (context,day){

    var formatter = new DateFormat('H:mm', "ja_JP");

    return AlertDialog(
      title: Text(DateFormat.yMMMd('ja').format(day)),
      content: Wrap(
        children: [
          eventList.containsKey(DateTime(day.year,day.month,day.day)) ?
          Row(
            children: [
              Text(eventList[DateTime(day.year,day.month,day.day)]["name"]
              ),
              Text(
                  formatter.format(eventList[DateTime(day.year,day.month,day.day)]["start"])
                      +"〜"
                      +formatter.format(eventList[DateTime(day.year,day.month,day.day)]["end"]))
            ],
          ):Text("イベントありません"),

          freeFriends.containsKey(DateTime(day.year,day.month,day.day)) ?
          Row(
            children: [
              Text(freeFriends[DateTime(day.year,day.month,day.day)]["name"]
              ),
              Text(
                  formatter.format(freeFriends[DateTime(day.year,day.month,day.day)]["start"])
                      +"〜"
                      +formatter.format(freeFriends[DateTime(day.year,day.month,day.day)]["end"]))
            ],
          ):Text("フレンドがいません"),






        ],
      ),
      actions: <Widget>[
        // ボタン領域

        FlatButton(
          child: Text("戻る"),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: Text("書き込む"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}


    List<String> ifCalenderList=[
      "一番遊べる人数が多い日",
      "自分が遊べる日の中で一番遊べる人数が多い日",
      "一番イベントが人気の日",
    ];


    List<dynamic> selectedEvent=[];


     List<dynamic> EventName_No1 = [
       DateTime(2020,11,11,18,00),
      "EventName No.1","山田太郎"
    ];



    List<dynamic> EventName_No2 = [
      DateTime(2020,11,26,15,00),
      "EventName No.2","加藤花子",];



    Map<DateTime,dynamic> freeFriends={
      DateTime(2020,11,3):{"name":"ぱぴよん",
        "start":DateTime(2020,11,3,12,00),"end":DateTime(2020,11,16,15,30)},
      DateTime(2020,11,3):{"name":"ぱぴよん",
        "start":DateTime(2020,11,3,12,00),"end":DateTime(2020,11,16,15,30)},
      DateTime(2020,11,16):{"name":"加藤Taka",
        "start":DateTime(2020,11,16,15,00),"end":DateTime(2020,11,16,18,30)},
      DateTime(2020,11,20):{"name":"国宗義晴",
        "start":DateTime(2020,11,20,9,00),"end":DateTime(2020,11,16,12,30)},
      DateTime(2020,11,30):{"name":"欽ちゃん",
        "start":DateTime(2020,11,30,15,00),"end":DateTime(2020,11,16,18,30)}
    };

Map<DateTime,dynamic> eventList={
  DateTime(2020,11,4):{"name":"飲み会in錦糸町！",
    "start":DateTime(2020,11,4,18,00),"end":DateTime(2020,11,4,22,00)},
  DateTime(2020,11,30):{"name":"神イベ",
    "start":DateTime(2020,11,30,12,00),"end":DateTime(2020,11,30,18,30)},
};

