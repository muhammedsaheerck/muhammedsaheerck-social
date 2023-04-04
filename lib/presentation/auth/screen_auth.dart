import 'package:flutter/material.dart';
import 'package:social/presentation/auth/screen_login.dart';
import 'package:social/presentation/auth/screen_signup.dart';

import '../../infrastructure/news_api.dart';

class ScreenAuth extends StatefulWidget {
  const ScreenAuth({super.key});

  @override
  State<ScreenAuth> createState() => _ScreenAuthState();
}

class _ScreenAuthState extends State<ScreenAuth>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            backgroundColor: Colors.red,
            title: Row(
              children: const [
                Text("Social"),
                Icon(
                  Icons.close,
                  size: 35,
                )
              ],
            ),
            titleTextStyle:
                const TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
            bottom: TabBar(
                controller: tabController,
                indicatorPadding: const EdgeInsets.only(bottom: 2, left: 2),
                unselectedLabelColor: Colors.white,
                indicator: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  color: Colors.white,
                ),
                labelPadding: const EdgeInsets.only(top: 15, bottom: 15),
                indicatorColor: Colors.blue.shade700,
                labelStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                tabs: [
                  Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                  Text("SIGN UP", style: TextStyle(color: Colors.grey.shade800))
                ]),
          ),
        ),
        body: TabBarView(
            controller: tabController,
            children: const [ScreenLogin(), ScreenSignUp()]));
  }
}
