


import 'package:cloud_firestore/cloud_firestore.dart';

import 'login_check.dart';


//global
final uid = currentUser.uid;
final db = FirebaseFirestore.instance;
final userDocument=db.collection('users').doc(uid);



