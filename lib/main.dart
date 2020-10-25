import 'package:intl/date_symbol_data_local.dart';

import 'package:asoble_app/pages/setup/welcome.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());




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