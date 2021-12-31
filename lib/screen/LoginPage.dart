import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login2/components/constant.dart';
import 'MyHomePage.dart';
import 'package:login2/screen/SignUpPage.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  var globalKey = GlobalKey<FormState>();
  TextEditingController eC = TextEditingController();
  TextEditingController pC = TextEditingController();
  static final id = '/login';

  saveform(BuildContext context) async {
    if (globalKey.currentState.validate()) {
      print(eC.text);
      await auth1
          .createUserWithEmailAndPassword(
              email: eC.text.trim(), password: pC.text)
          .catchError((errormsg) {
        Fluttertoast.showToast(msg: errormsg);
      });
      var u = auth1.currentUser.uid;

      if (u != null) {
        Navigator.pushNamed(context, Login.id);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.fitHeight,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                          'LOGIN AS A RIDER',
                          style: mainStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Form(
                            key: globalKey,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  inputText(),
                                  inputText2(),
                                  signButton(context),
                                  alreadyaccount(context),
                                  googlesignInButton(context),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row alreadyaccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'already have an account?',
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, SignUp.id);
          },
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  InkWell signButton(BuildContext context) {
    return InkWell(
      onTap: () {
        saveform(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'SIGNUP',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }

  Padding inputText2() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black.withOpacity(0.5)),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            validator: (v) {
              if (pC.text.length < 7) {
                return 'password should be greater than 7';
              }
              return null;
            },
            controller: pC,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.white, fontSize: 20),
            decoration: InputDecoration(
                hintText: 'Enter Password',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }

  Padding inputText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black.withOpacity(0.5)),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            validator: (v) {
              if (!eC.text.contains('@')) {
                return 'Please Enter Valid Email';
              }
              return null;
            },
            controller: eC,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.white, fontSize: 20),
            decoration: InputDecoration(
                hintText: 'Enter Email',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }

  Widget googlesignInButton(BuildContext context) {
    return Column(
      children: [
        Text(
          'OR',
          style: TextStyle(color: Colors.white.withOpacity(0.5)),
        ),
        MaterialButton(
          shape: StadiumBorder(),
          color: Colors.white,
          onPressed: () async {
            GoogleSignIn gsn = GoogleSignIn();
            await gsn.signIn();

            if (gsn.currentUser != null) {
              print(gsn);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HomePage(
                      photourl: gsn.currentUser.photoUrl,
                      name: gsn.currentUser.displayName),
                ),
              );
            }
          },
          child: Text(
            'LOGIN WITH GOOGLE',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
