

import 'package:asoble_app/pages/navigation_bar/navigation_bar.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';



Size mediaSize;
void mediaSizeDefine(context){
  final Size size = MediaQuery.of(context).size;
  mediaSize = size;
}

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  @override
  RootPageState createState() => RootPageState();
}


final currentUser = FirebaseAuth.instance.currentUser;
class RootPageState extends State<RootPage> {


  @override
  initState() {
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Loading..."),
        ),
      ),
    );

  }

  void checkUser() async{
    final userState = await Provider.of<UserModel>(context,listen: false);

    if(currentUser == null){

       Navigator.pushReplacementNamed(context,"/welcome");

    }else{
      userState.setUser(currentUser);
       Navigator.pushReplacementNamed(context, "/home");
    }
  }

}