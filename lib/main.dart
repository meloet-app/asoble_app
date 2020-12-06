import 'package:asoble_app/models/calender_model.dart';
import 'package:asoble_app/models/unique_event_model.dart';
import 'package:asoble_app/preference/theme.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/current_event_model.dart';
import 'models/input_asoble_info_model.dart';
import 'models/select_community_model.dart';

final themeData = ThemeData(
    typography: kTypography, // fontFamily と locale が設定してあるものを指定する
);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SelectCommunityModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => EventCarouselModel(),
        ),
        ChangeNotifierProvider(create: (_) => SelectIfCalenderModel()),
        ChangeNotifierProvider(create: (_) => UniqueEventModel()),
        ChangeNotifierProvider(create: (_) => InputAsobleInfoModel()),
        ChangeNotifierProvider(create: (_) => CalendarDialogModel()),
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
      locale: Locale('ja'),
      title: 'Flutter Demo',
      theme: themeData,
      home: WelcomePage(),
    );
  }
}
