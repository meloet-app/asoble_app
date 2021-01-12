
import 'dart:io';

import 'package:asoble_app/pages/navigation_bar/navigation_bar.dart';
import 'package:asoble_app/preference/theme.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'models/calender_model.dart';
import 'models/clip_board_model.dart';
import 'models/current_event_model.dart';
import 'models/input_asoble_info_model.dart';
import 'models/select_community_model.dart';
import 'models/unique_event_model.dart';
import 'models/user_model.dart';

import 'login_check.dart';

import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:cloud_functions/cloud_functions.dart';

void run({bool isEmulator =false}) async {

  print("start(isEmulator:$isEmulator)");
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
        child: MyApp(isEmulator:isEmulator),
      ));
}


final themeData = ThemeData(
  typography: kTypography, // fontFamily と locale が設定してあるものを指定する
);

class MyApp extends StatelessWidget {
  final isEmulator;

  MyApp({this.isEmulator});


  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ja');

    return MaterialApp(
      locale: Locale('ja'),
      title: 'Flutter Demo',
      theme: themeData,
      home: FireInit(isEmulator:isEmulator),
      routes: <String,WidgetBuilder>{
        '/home':(BuildContext context) => NavigationBar(),
        '/welcome':(BuildContext context) => WelcomePage(),
      },
    );



    }
}

class FireInit extends StatelessWidget {
  final isEmulator;

  FireInit({this.isEmulator});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {

          // エラー時に表示するWidget
          if (snapshot.hasError) {
            return Container(color: Colors.red,);
          }

          // Firebaseのinitialize完了したら表示したいWidget
          if (snapshot.connectionState == ConnectionState.done) {
            if (isEmulator == true) {
              localFirebaseSetup(context);
            }else if (isEmulator == false) {
              checkUser(context);}
          }

            // Firebaseのinitializeが完了するのを待つ間に表示するWidget
            return Center(child: CircularProgressIndicator());

        }),
    );

  }
}

Future localFirebaseSetup(context) async {

  print("localFirebaseSetup()start");

  final domain =  (!kIsWeb && Platform.isAndroid) ? '10.0.2.2' : 'localhost';
  await FirebaseFunctions.instance.useFunctionsEmulator(origin: 'http://$domain:5001');
  await useFirestoreEmulator();

  final result = await FirebaseFunctions.instance
      .httpsCallable('now')
      .call();

  print(result.data);
  print("localFirebaseSetup()end");

  checkUser(context);
}