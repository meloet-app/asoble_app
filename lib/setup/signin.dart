
import 'package:asoble_app/pages/my_home_page.dart';
import 'package:asoble_app/pages/navigation_bar/navigation_bar.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

DocumentChange userDocument;
String userDocumentString;

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
      body: Center(
        child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                width: mediaSize.width*0.8,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (input) {
                          if (input.length < 6) {
                            return '６文字以上のパスワードを入力して下さい';
                          }
                          else{return null;}
                        },
                        decoration: InputDecoration(
                            labelText: 'Password'
                        ),
                        onSaved: (input) => _password = input,
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: signIn,
                        child: Text('Sign in'),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
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
            context, MaterialPageRoute(builder: (context) => NavigationBar()));
      } catch (e) {

        print("失敗");
        print(e);
      }
    }
  }
}





