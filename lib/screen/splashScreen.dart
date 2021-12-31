import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login2/screen/LoginPage.dart';


class SplashScreen extends StatefulWidget {
  static final id = '/splash';

  @override
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Login(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Image.asset('images/rider.png'),
          ),
          Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
