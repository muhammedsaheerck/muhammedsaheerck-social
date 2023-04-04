import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Icon? icon;
  const CustomTextField({
    super.key,
    required this.keybordtype,
    required this.hint,
    this.icon,
    this.controller,
    this.validator,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keybordtype;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      // obscureText: true,
      keyboardType: keybordtype,
      decoration: InputDecoration(
        suffixIcon: icon,
        suffixIconColor: Colors.red,
        hintText: hint,
      ),
      // validator: ,
    );
  }
}
