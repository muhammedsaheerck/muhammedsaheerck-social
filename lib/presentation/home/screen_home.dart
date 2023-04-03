import 'package:flutter/material.dart';
import 'package:social/core/core_datas.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) => Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 4,
              shadowColor: Colors.grey.shade600,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("2 hours ago"),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "BBC News",
                                style: TextStyle(
                                    color: Colors.grey.shade800, fontSize: 15),
                              ),
                            ],
                          ),
                          height10,
                          const Text(
                            "asdfghkadfljhfsldlhlsllsshlsdfgdshddsagjjgs",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            overflow: TextOverflow.clip,
                          ),
                          height10,
                          const Text(
                            "datasdjdkgalbkljsadgkbjasdbvlasdvv vsdabkjsdvskkasbfksdb",
                            style: TextStyle(
                              color: Colors.blue,
                              overflow: TextOverflow.clip,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "asset/india.png",
                      width: 70,
                      height: 70,
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
