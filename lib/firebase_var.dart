


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'login_check.dart';


//global
final uid = currentUser.uid;
final db = FirebaseFirestore.instance;

getFirestoreUser() async {
  final wkUserDocument = db.collection('users').doc(uid);
  final wkUserInfo =  await wkUserDocument.get();
  final wkUserName = wkUserInfo.data()['name'];
  return wkUserName;
}

final userName = getFirestoreUser();


