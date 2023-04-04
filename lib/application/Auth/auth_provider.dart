import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/auth_firebase.dart';
import '../../presentation/home/screen_home.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //dropdown contry code
  String dropdownvalue = "+91";
  var items = ["+91", "+92", "+88"];
  void dropNumFormate(String value) {
    dropdownvalue = value;
    notifyListeners();
  }

  //sign in terms check
  bool valiu = false;
  void checkTerms(bool val) {
    valiu = val;
    notifyListeners();
  }

  //Auth sign Up

  Future<void> createUser(
      {required String email, required String password, context}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context).pop();
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

//Auth sign in

  Future<void> signInWithemail(String email, String password, context) async {
    try {
      await AuthFire().signIn(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('SignIn  successfull')),
      );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ScreenHome()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());

      log(e.code.toString());
    }
    notifyListeners();
  }

  // Future<void> signUPWithemail(String email, String password, context) async {
  //   try {
  //     await AuthFire().createUser(email: email, password: password);
  //     Navigator.of(context).pop();
  //   } on FirebaseAuthException catch (e) {
  //     log(e.message.toString());
  //   }
  //   notifyListeners();
  // }
}
