import 'package:asoble_app/setup/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier{
  User user;
  void setUser(User currentUser){
    user = currentUser;
    notifyListeners();
  }
}

class UserNameModel extends ChangeNotifier{
 /* String userName = "$getUserDocument['userName']";

  changeUserName(newName){
    userDocument.update({"userName":newName});
    notifyListeners();
  }

  deleteDocument(){
    userDocument.delete();*/
  }
