import 'dart:convert';

import 'package:freash_news/models/newsArticle.dart';
import 'package:freash_news/utils/constants.dart';

import 'package:http/http.dart' as http;
import 'dart:developer';

class Webservice2 {

  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async {

   
    final response = await http.get(Uri.parse(Constants.headlinesFor(keyword)));

    log(response.statusCode.toString());
    if(response.statusCode == 200)
    {
      const JsonDecoder decoder = JsonDecoder();
      final Map<String, dynamic> object = decoder.convert(response.body);
      final item = object['articles'][0];
      //final result = JsonDecoder(response.body);
       log(item.toString());
      Iterable list = object["articles"];


    //   log(item["articles"].toString());

      return list.map((article) => NewsArticle.fromJSON(article)).toList();

       

    }else {
      throw Exception("Failed to get top news");
    }
  }


  Future<List<NewsArticle>> fetchTopHeadLines() async {
   final response = await http.get(Uri.parse(Constants.TOOP_HEADLINES_URL));

    log(response.statusCode.toString());
    if(response.statusCode == 200)
    {
      const JsonDecoder decoder = JsonDecoder();
      final Map<String, dynamic> object = decoder.convert(response.body);
      final item = object['articles'][0];
      //final result = JsonDecoder(response.body);
       log(item.toString());
      Iterable list = object["articles"];


    //   log(item["articles"].toString());

      return list.map((article) => NewsArticle.fromJSON(article)).toList();

      


       

    }else {
      throw Exception("Failed to get top news");
    }
  }
}
