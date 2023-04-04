import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:social/domain/news_model.dart';

class NewsApiCalls {
  var dio = Dio();
  Future<List<NewsApiModel>> getNews() async {
    try {
      Response response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=821e9aac93fc4e7992f2ff69416b5b59");
      log(response.data.toString());
      // log(response.statusCode.toString());
      if (response.statusCode == 200) {
        List<NewsApiModel> newList = [];
        NewsApiModel newsMap = NewsApiModel.fromJson(response.data);
        newList.add(newsMap);
        return newList;
      }
    } on DioError catch (e) {
      log("eeeeeeeeeeeeeeeeeee${e.response!.data.toString()}");
    }
    return [];
  }
}
