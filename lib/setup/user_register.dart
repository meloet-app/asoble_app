
import 'package:asoble_app/pages/my_home_page.dart';
import 'package:asoble_app/pages/navigation_bar/navigation_bar.dart';
import 'package:asoble_app/setup/signup.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../login_check.dart';



class UserResisterPage extends StatefulWidget {

  @override
  _UserResisterPageState createState() => _UserResisterPageState();
}



class _UserResisterPageState extends State<UserResisterPage> {

  final GlobalKey<FormState> _ProfileFormKey = GlobalKey<FormState>();

  String _userBirthday = "入力して下さい";
  DateTime _birthdayAv;
  String _userName, _userGender;

  double _maleButtonOpacity = 0.5;
  double _femaleButtonOpacity = 0.5;
  double _freeGenderButtonOpacity = 0.5;
  FontWeight _maleFontWeight = FontWeight.normal;
  FontWeight _femaleFontWeight = FontWeight.normal;
  FontWeight _freeGenderFontWeight = FontWeight.normal;



  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      //キーボードが出たときのレンダーエラー
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(),

      body: Form(
          key:_ProfileFormKey,
          child: Center(
            child: Container(
              height:mediaSize.height,
              margin: EdgeInsets.only(top:60),
              width:mediaSize.width*0.7,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text("あなたの名前を教えて下さい"),
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'ユーザーネームは必須です';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'ユーザーネームを入力して下さい',
                      //Focusしていないとき
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      //Focusしているとき
                      focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 3.0,
                        ),
                      ),
                    ),
                    onSaved: (input) => _userName = input,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:24.0),
                    child: Text("あなたの性別を教えて下さい"),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,top:36.0,right: 8.0,bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            FloatingActionButton(

                                heroTag: "hero1",
                              backgroundColor: Colors.blue.withOpacity(_maleButtonOpacity),
                                child: Icon(
                                    Icons.account_circle_outlined,
                                  size: 50,
                                ),
                                onPressed: (){
                                  setState(() {
                                    _userGender = "male";

                                    _maleButtonOpacity = 1;
                                    _femaleButtonOpacity = 0.5;
                                    _freeGenderButtonOpacity = 0.5;

                                    _maleFontWeight = FontWeight.bold;
                                    _femaleFontWeight = FontWeight.normal;
                                    _freeGenderFontWeight =FontWeight.normal;
                                  });
                                }
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("男性",style: TextStyle(fontWeight:_maleFontWeight),),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            FloatingActionButton(
                                heroTag: "hero2",
                              backgroundColor: Colors.pink.withOpacity(_femaleButtonOpacity),
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  size: 50,
                                ),
                                onPressed: (){
                                  setState(() {
                                    _userGender = "female";

                                    _maleButtonOpacity = 0.5;
                                    _femaleButtonOpacity = 1;
                                    _freeGenderButtonOpacity = 0.5;

                                    _maleFontWeight = FontWeight.normal;
                                    _femaleFontWeight = FontWeight.bold;
                                    _freeGenderFontWeight =FontWeight.normal;
                                  });
                              }
                                ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("女性",style: TextStyle(fontWeight:_femaleFontWeight),),
                            )],
                        ),
                        Column(
                          children: [
                            FloatingActionButton(
                                heroTag: "hero3",
                              backgroundColor: Colors.deepPurple.withOpacity(_freeGenderButtonOpacity),
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  size: 50,
                                ),
                                onPressed: (){
                                  setState(() {
                                    _userGender = "other";

                                    _maleButtonOpacity = 0.5;
                                    _femaleButtonOpacity = 0.5;
                                    _freeGenderButtonOpacity = 1;

                                    _maleFontWeight = FontWeight.normal;
                                    _femaleFontWeight = FontWeight.normal;
                                    _freeGenderFontWeight =FontWeight.bold;
                                  });
                                }),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("その他",style: TextStyle(fontWeight:_freeGenderFontWeight),),
                            )],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text("誕生日を教えて下さい"),
                  ),
                FlatButton(
                  onPressed: () async{

                    await DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1900, 1, 1),
                        maxTime: DateTime.now(),
                        onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          _birthdayAv = date;
                          print('confirm $date');
                        }, currentTime: DateTime(2000, 1, 1), locale: LocaleType.jp);
                    setState(() {
                      _userBirthday = DateFormat('yyyy/MM/dd', "ja_JP").format(_birthdayAv);
                    });
                  },
                  child: Text(
                    "誕生日："+_userBirthday,
                    style: TextStyle(color: Colors.blue),
                  )),
                  RaisedButton(
                    onPressed: Register,
                    child: Text('次へ'),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

  Register() async {
    if((_ProfileFormKey.currentState.validate()) && (_userBirthday != "入力して下さい") && (_userGender != null)){
      _ProfileFormKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEmail, password: userPassword).

        then((currentUser) => FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.user.uid)
            .set({
          "name" : _userName,
          "gender":_userGender,
          "icon":"iconURL",
          "birthday":_userBirthday,
          "isFree" : false
        }));
        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterConfirmPage()));
      }catch(e){
        print(e.message);
      }
    }else{
       showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("プロフィールを入力して下さい"),
            content: Text("ユーザーネームと性別と\n誕生日は必須です"),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("OK"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    }
  }
}





class RegisterConfirmPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              child: Text("戻る"),
              onPressed: () =>  Navigator.pop(context),
            ),
            OutlinedButton(
                child: Text("これで始める"),
              onPressed: () =>  checkUser(context),
          )

        ],
      )
      ),
    );
  }
}

