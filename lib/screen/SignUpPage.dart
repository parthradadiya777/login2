import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login2/components/constant.dart';
import 'package:login2/screen/LoginPage.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  var globalKey = GlobalKey<FormState>();

  TextEditingController nC = TextEditingController();
  TextEditingController eC = TextEditingController();
  TextEditingController pC = TextEditingController();

  static final id = '/signup';

  saveform(BuildContext context) async {
    if (globalKey.currentState.validate()) {
      print(eC.text);
      await auth1
          .createUserWithEmailAndPassword(
              email: eC.text.trim(), password: pC.text)
          .catchError((errormsg) {
        Fluttertoast.showToast(msg: errormsg);
      });
      Map userMap = {'name': nC.text, 'Email': eC.text, 'Password': pC.text};
      var u = auth1.currentUser.uid;
      if (u != null) {
        userRef.child(auth1.currentUser.uid).set({userMap});
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
                  height: 600,
                  width: double.infinity,
                  child: ListView(
                    children: [
                      Expanded(
                        child: Text(
                          'SIGNUP AS A RIDER',
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black.withOpacity(0.5)),
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: nC,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                          decoration: InputDecoration(
                                              hintText: 'Enter User Name',
                                              hintStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.5)),
                                              prefixIcon: Icon(
                                                Icons.person,
                                                color: Colors.white,
                                              ),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black.withOpacity(0.5)),
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          // validator: (v) {
                                          //   if (!eC.text.contains('@')) {
                                          //     return 'Please Enter Valid Email';
                                          //   }
                                          //   return null;
                                          // },
                                          controller: eC,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                          decoration: InputDecoration(
                                              hintText: 'Enter Email',
                                              hintStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.5)),
                                              prefixIcon: Icon(
                                                Icons.email,
                                                color: Colors.white,
                                              ),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black.withOpacity(0.5)),
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          // validator: (v) {
                                          //   if (pC.text.length < 7) {
                                          //     return 'password should be greater than 7';
                                          //   }
                                          //   return null;
                                          // },
                                          controller: pC,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                          decoration: InputDecoration(
                                              hintText: 'Enter Password',
                                              hintStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.5)),
                                              prefixIcon: Icon(
                                                Icons.lock,
                                                color: Colors.white,
                                              ),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (nC.text.length < 3) {
                                        displayMessage(
                                            'name must be 3 characrter long');
                                      } else if (!eC.text.contains('@')) {
                                        displayMessage('Email bady Formated');
                                      } else if (pC.text.length < 7) {
                                        displayMessage(
                                            'Password should atleast 7 character long');
                                      } else {
                                        saveform(context);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      width: double.infinity,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Text(
                                            'SIGNUP',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'already have an account?',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, Login.id);
                                        },
                                        child: Text(
                                          'SIGNUP',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
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
}
