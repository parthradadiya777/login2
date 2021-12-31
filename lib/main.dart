import 'package:flutter/material.dart';
import 'package:login2/screen/LoginPage.dart';
import 'package:login2/screen/SignUpPage.dart';
import 'package:login2/screen/splashScreen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login With Firebase',
      initialRoute: Login.id,
      routes: {
        SplashScreen.id: (contex) => SplashScreen(),
        SignUp.id: (context) => SignUp(),
        Login.id: (context) => Login(),
      },
    );
  }
}
