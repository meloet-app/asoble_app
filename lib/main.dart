
import 'package:asoble_app/models/calender_model.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:intl/date_symbol_data_local.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/current_event_model.dart';
import 'models/select_community_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> SelectCommunityModel(),),
        ChangeNotifierProvider(create: (_)=> EventCarouselModel(),),
        ChangeNotifierProvider(create: (_)=> SelectIfCalenderModel()),
      ],
      child: MyApp(),
    ),
  );
}




class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    initializeDateFormatting('ja');
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: WelcomePage(),
    );
  }
}