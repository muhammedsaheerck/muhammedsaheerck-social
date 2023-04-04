import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
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
}
