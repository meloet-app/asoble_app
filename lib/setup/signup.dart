
import 'package:asoble_app/setup/user_register.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';



String userEmail, userPassword;

class SignUpPage extends StatefulWidget {
  @override
  SignUpPageState createState() => SignUpPageState();
}


class SignUpPageState extends State<SignUpPage> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              width: mediaSize.width * 0.8,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Provide an email';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Email'
                    ),
                    onSaved: (input) => userEmail = input,
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input.length < 6) {
                        return 'Longer password please';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Password'
                    ),
                    onSaved: (input) => userPassword = input,
                    obscureText: true,
                  ),
                  RaisedButton(
                    onPressed: () {
                      signUp();
                    },
                    child: Text('Sign up'),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

  void signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserResisterPage()));
    }
  }

}