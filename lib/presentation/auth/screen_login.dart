import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/application/Auth/auth_provider.dart';
import 'package:social/application/home/home_provider.dart';
import 'package:social/core/core_datas.dart';
import 'package:social/presentation/home/screen_home.dart';
import 'widgets/custom_textfield.dart';
import 'widgets/text_field_name.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final _formKeySIgnIn = GlobalKey<FormState>();
  final signInEmailCOntroller = TextEditingController();
  final signInPasswordCOntroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.46,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child:
                  Consumer<AuthProvider>(builder: (context, valuePro, child) {
                return Form(
                  key: _formKeySIgnIn,
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
                          keybordtype: TextInputType.emailAddress,
                          controller: signInEmailCOntroller,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "Please enter your email";
                            } else if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(signInEmailCOntroller.text)) {
                              return 'Incorrect  email';
                            }
                            return null;
                          }),
                          hint: 'johndoe@gmail.com',
                          icon: const Icon(Icons.email)),
                      height10,
                      TextFieldName(
                        name: 'Password',
                      ),
                      CustomTextField(
                        keybordtype: TextInputType.text,
                        controller: signInPasswordCOntroller,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Please fill the password field";
                          }
                          return null;
                        }),
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
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
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
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  ),
                );
              }),
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
            onPressed: () async {
              logIn(signInEmailCOntroller.text, signInPasswordCOntroller.text,
                  context, _formKeySIgnIn);
              // await Provider.of<HomeProvider>(context, listen: false)
              //     .getArticles();
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const ScreenHome(),
              // ));
            },
            child: const Text(
              "LOGIN",
            ),
          )
        ],
      ),
    );
  }

  void logIn(
      String email, String pass, context, GlobalKey<FormState> formkey) async {
    if (signInEmailCOntroller.text.isNotEmpty &&
        signInPasswordCOntroller.text.isNotEmpty) {
      if (formkey.currentState!.validate()) {
        await Provider.of<AuthProvider>(context, listen: false)
            .signInWithemail(email, pass, context);
        signInEmailCOntroller.clear();
        signInPasswordCOntroller.clear();
        await Provider.of<HomeProvider>(context, listen: false).getArticles();

        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => const ScreenHome(),
        // ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all field')),
      );
    }
  }
}
