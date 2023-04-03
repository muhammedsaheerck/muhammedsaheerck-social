import 'package:flutter/material.dart';
import 'package:social/core/core_datas.dart';

import 'widgets/custom_textfield.dart';
import 'widgets/text_field_name.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.47,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "SignIn into your \nAccount",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  height10,
                  TextFieldName(
                    name: 'Email',
                  ),
                  CustomTextField(
                      hint: 'johndoe@gmail.com', icon: const Icon(Icons.email)),
                  height10,
                  TextFieldName(
                    name: 'Password',
                  ),
                  CustomTextField(
                    hint: 'Password',
                    icon: const Icon(Icons.lock),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 2),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 3),
                    child: const Text("Login With"),
                  ),
                  height10,
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "asset/download.png",
                          width: 40,
                        ),
                        Image.asset(
                          "asset/facebook.png",
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an Account ? "),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Register Now",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          height10,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(62),
                backgroundColor: Colors.red,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                )),
            onPressed: () {},
            child: const Text(
              "LOGIN",
            ),
          )
        ],
      ),
    );
  }
}
