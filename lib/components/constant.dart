
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

var imageUrl =
    'https://images.unsplash.com/photo-1549399542-7e3f8b79c341?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGNhcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';

TextStyle mainStyle = TextStyle(fontSize: 40);

FirebaseAuth auth1 = FirebaseAuth.instance;

DatabaseReference  userRef = FirebaseDatabase.instance.reference().child('users');

displayMessage(String message) {
  Fluttertoast.showToast(msg: message);
}
