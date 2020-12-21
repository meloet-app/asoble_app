import 'package:asoble_app/models/calender_model.dart';
import 'package:asoble_app/models/unique_event_model.dart';
import 'package:asoble_app/pages/from_profile_pages/add_freind_page.dart';
import 'package:asoble_app/pages/navigation_bar/navigation_bar.dart';
import 'package:asoble_app/preference/theme.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_check.dart';
import 'models/clip_board_model.dart';
import 'models/current_event_model.dart';
import 'models/input_asoble_info_model.dart';
import 'models/select_community_model.dart';
import 'models/user_model.dart';

final themeData = ThemeData(
    typography: kTypography, // fontFamily と locale が設定してあるものを指定する
);



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
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
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => GetClipBoardModel()),

      ],
      child: MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ja');

    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {

        // エラー時に表示するWidget
        if (snapshot.hasError) {
          return Container(color: Colors.red);

        }

        // Firebaseのinitialize完了したら表示したいWidget
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            locale: Locale('ja'),
            title: 'Flutter Demo',
            theme: themeData,
            home: RootPage(),
              routes: <String,WidgetBuilder>{
              '/home':(BuildContext context) => NavigationBar(),
              '/welcome':(BuildContext context) => WelcomePage(),
              },
          );
        }
        // Firebaseのinitializeが完了するのを待つ間に表示するWidget
        return Center(child: CircularProgressIndicator());
      },
    );

  }
}
