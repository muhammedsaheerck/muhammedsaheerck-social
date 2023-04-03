import 'package:flutter/material.dart';

class TextFieldName extends StatelessWidget {
  String name;
  TextFieldName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
    );
  }
}
