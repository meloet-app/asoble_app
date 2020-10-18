import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:asoble_app/pages/setup/signin.dart';

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {



  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if(input.isEmpty){
                    return 'Provide an email';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Email'
                ),
                onSaved: (input) => _email = input,
              ),
              TextFormField(
                validator: (input) {
                  if(input.length < 6){
                    return 'Longer password please';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                onSaved: (input) => _password = input,
                obscureText: true,
              ),
              RaisedButton(
                onPressed: signUp,
                child: Text('Sign up'),
              ),
            ],
          )
      ),
    );
  }

  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password).

        then((currentUser) => FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.user.uid)
            .set({
          "name" : "username",
          "gender":"",
          "icon":"iconURL",
          "birthday":"yyyy/mm/dd",
          "isFree" : false
        }));

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){
        print(e.message);
      }
    }
  }
}