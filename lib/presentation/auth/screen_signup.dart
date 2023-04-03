import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/application/auth_provider.dart';
import 'package:social/presentation/auth/screen_login.dart';

import '../../core/core_datas.dart';
import 'widgets/custom_textfield.dart';
import 'widgets/text_field_name.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children: [
          height10,
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.43,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create an\nAccount",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  height10,
                  TextFieldName(
                    name: "Name",
                  ),
                  // height10,
                  CustomTextField(
                      hint: "John doe", icon: const Icon(Icons.person)),
                  height10,
                  TextFieldName(
                    name: 'Email',
                  ),
                  CustomTextField(
                      hint: 'johndoe@gmail.com', icon: const Icon(Icons.email)),
                  height10,
                  height10,
                  TextFieldName(name: "Contact no"),
                  height10,
                  Row(
                    children: [
                      Image.asset(
                        "asset/india.png",
                        width: 35,
                      ),
                      width10,
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "IN",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Consumer<AuthProvider>(
                        builder: (context, valuePro, child) => DropdownButton(
                          value: valuePro.dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: valuePro.items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            valuePro.dropNumFormate(newValue!);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: CustomTextField(
                            hint: "1234567890", icon: const Icon(Icons.call)),
                      )
                    ],
                  ),
                  height10,
                  TextFieldName(
                    name: 'Password',
                  ),
                  CustomTextField(
                    hint: 'Password',
                    icon: const Icon(Icons.lock),
                  ),
                  height10,
                  Row(
                    children: [
                      Checkbox(
                          value:
                              Provider.of<AuthProvider>(context, listen: false)
                                  .valiu,
                          onChanged: (bool? value) {
                            Provider.of<AuthProvider>(context, listen: false)
                                .checkTerms(value!);
                          }),
                      const Text("I agree with"),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "terms&condition",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an Account ?"),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Sign In!",
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
                minimumSize: const Size.fromHeight(52),
                backgroundColor: Colors.red,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                )),
            onPressed: () {},
            child: const Text(
              "REGISTER",
            ),
          )
        ],
      ),
    );
  }
}
