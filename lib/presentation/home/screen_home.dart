import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/application/home/home_provider.dart';
import 'package:social/core/core_datas.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Consumer<HomeProvider>(builder: (context, valuePro, child) {
              return TextField(
                controller: valuePro.controller,
                  onChanged: (value) => valuePro.searchNews(value),
                  decoration: InputDecoration(
                      hintText: "Search in feed",
                      hintStyle:
                          TextStyle(color: Colors.blue.shade800, fontSize: 22),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 35,
                      ),
                      prefixIconColor: Colors.blue.shade800));
            }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<HomeProvider>(builder: (context, value, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: value.news.length,
                  itemBuilder: (context, index) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 4,
                      shadowColor: Colors.grey.shade900,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      value.news[index].publishedAt.toString()),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    value.news[index].source!.name.toString(),
                                    style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.6,
                                    child: Column(
                                      children: [
                                        height10,
                                        Text(
                                          value.news[index].title.toString(),
                                          style: TextStyle(
                                              color: Colors.blue.shade800,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                          overflow: TextOverflow.clip,
                                          maxLines: 2,
                                        ),
                                        height10,
                                        Text(
                                            value.news[index].description
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.blue.shade800,
                                              overflow: TextOverflow.clip,
                                            ),
                                            maxLines: 4),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: Image.network(
                                      value.news[index].urlToImage == null
                                          ? "https://th.bing.com/th/id/OIP.n7ajLUEb277vIJ4loEWbBAHaGV?pid=ImgDet&rs=1"
                                          : value.news[index].urlToImage
                                              .toString(),
                                      fit: BoxFit.fill,
                                      width: 80,
                                      height: 80,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ))),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
