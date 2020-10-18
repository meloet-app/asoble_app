import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

DocumentSnapshot userDocument;
String userDocumentString;
bool freeTag = false;
Color freeColor = Colors.green;
String freeText ="ひまじゃない；；";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
                  if (input.isEmpty) {
                    return 'メールアドレスを入力して下さい';
                  }else{
                    return null;}
                },
                decoration: InputDecoration(
                    labelText: 'Email'
                ),
                onSaved: (input) => _email = input,
              ),
              TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return '６文字以上のパスワードを入力して下さい';
                  }else{
                    return null;}
                },
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                onSaved: (input) => _password = input,
                obscureText: true,
              ),
              RaisedButton(
                onPressed: signIn,
                child: Text('Sign in'),
              ),
            ],
          )
      ),
    );
  }


  Future signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        final User user = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: _email, password: _password)).user;
        print('Singed in: ${user.uid}');
        userDocumentString = user.uid;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home1()));
      } catch (e) {
        print("失敗");
        print(e);
      }
    }
  }
}

class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => new _Home1State();
}

class _Home1State extends State<Home1> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body:Center(
          child: Column(
              mainAxisAlignment:MainAxisAlignment.center
              ,children: <Widget>[
            Container(
                child: Text("今ひま？")
            ),
            RaisedButton(
              color: freeColor,
              onPressed: ()=> setState((){ freeTagChange();}),
              child: Text(freeText),
            ),
      ]
          ),
        )
    );
  }
}


 Future freeTagChange() async{

  if (freeTag == true) {
    freeTag = false;
    freeColor = Colors.red;
    freeText = "ひまじゃない；；";
  } else {
    freeTag = true;
    freeColor = Colors.blue;
    freeText = "ひま！！！";
  }



  await FirebaseFirestore.instance
      .collection('users')
    .doc(userDocumentString)
    .update({'freeTag':freeTag});


}
