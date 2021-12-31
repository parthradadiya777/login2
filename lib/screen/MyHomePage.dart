import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login2/screen/LoginPage.dart';


class HomePage extends StatelessWidget {

  final String photourl;
  final String name;

  static final id = 'home';
  final GoogleSignIn gSn = GoogleSignIn();

  HomePage({this.photourl, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login With FireBase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HI $name'),
            Image.network(gSn.currentUser.photoUrl),
            ElevatedButton(
              onPressed: () async {
                FirebaseAuth auth2 = FirebaseAuth.instance;

                await auth2.signOut();
                await gSn.signOut();

                Navigator.pushNamedAndRemoveUntil(
                    context, Login.id, (route) => false);
              },
              child: Text('LOGOUT'),
            ),
          ],
        ),
      ),
    );
  }
}



