import 'package:firebase_auth/firebase_auth.dart';
import 'package:asoble_app/pages/home.dart';
import 'package:flutter/material.dart';

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

  Future<User> signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        final User user = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: _email, password: _password)).user;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TextGO ()/*Home(user: user)*/));
        print('Singed in: ${user.uid}');
        return user;
      } catch (e) {
        print("失敗");
        print(e);
      }
    }
  }
}

class TextGO  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body:Center(child: Text("サインインしたってばよ!!!!!")));
  }
}