

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigation_bar/navigation_bar.dart';

class CalenderPage extends StatelessWidget {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithDropDown(),
      body:Center(child: Text("カレンダー"))
    );
  }
}