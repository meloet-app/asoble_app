
import 'package:asoble_app/setup/signin.dart';
import 'package:asoble_app/setup/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../login_check.dart';



class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    mediaSizeDefine(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My firebase app'),
      ),
      body: Center(
        child: Container(
          width:mediaSize.width*0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                onPressed: navigateToSignIn,
                child: Text('Sign in'),
              ),
              RaisedButton(
                onPressed: navigateToSignUp,
                child: Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}
