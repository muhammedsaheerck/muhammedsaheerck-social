import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social/domain/news_model.dart';

import '../../infrastructure/news_api.dart';

class HomeProvider extends ChangeNotifier {
  List<Article> news = [];
  List<NewsApiModel> response = [];
  TextEditingController controller = TextEditingController();

  Future<void> getArticles() async {
    news.clear();
    response.clear();
    response = await NewsApiCalls().getNews();
    for (var element in response) {
      news.addAll(element.articles!);
      log(element.articles![0].author.toString());
      notifyListeners();
    }

    notifyListeners();
  }

  //search news
  void searchNews(String enterdString) {
    List<Article> results = [];
    if (enterdString.isEmpty) {
      results.clear();
      results.addAll(news);
    } else {
      results = news
          .where((element) =>
              element.title!.toLowerCase().contains(enterdString.toLowerCase()))
          .toList();
      notifyListeners();
    }
    news.clear();
    news.addAll(results);
    notifyListeners();
  }
}
