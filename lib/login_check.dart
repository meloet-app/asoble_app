import 'package:asoble_app/pages/navigation_bar/navigation_bar.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




Size mediaSize;
void mediaSizeDefine(context){
  final Size size = MediaQuery.of(context).size;
  mediaSize = size;
}

var currentUser;

Future checkUser(context) async {

    currentUser = await FirebaseAuth.instance.currentUser;

    if(currentUser == null){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
      print("==============null===============");
    }else{
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NavigationBar()));
      print("==============${currentUser.uid}===============");
    }
}
