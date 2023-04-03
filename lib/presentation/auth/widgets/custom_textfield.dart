import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String hint;
  Icon? icon;
  CustomTextField({super.key, required this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        suffixIcon: icon,
        suffixIconColor: Colors.red,
        hintText: hint,
      ),
    );
  }
}
