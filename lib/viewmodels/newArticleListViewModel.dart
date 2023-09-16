

import 'package:flutter/material.dart';
import 'package:freash_news/models/newsArticle.dart';
import 'package:freash_news/service/webservice.dart';
import 'package:freash_news/viewmodels/newsArticleViewModel.dart';
enum LoadingStatus{
  completed,
  searching,
  empty
}

class NewsArticleListViewModel extends ChangeNotifier{

  var loadingStatus = LoadingStatus.searching;

  //List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();
   List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];



  Future<void> search(String keyword) async{
    List<NewsArticle> newsArticles =  await Webservice().fetchHeadlinesByKeyword(keyword);
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
 
  }
  

  Future<void> populateTopHeadlines() async {
    List<NewsArticle> newsArticles = await Webservice().fetchTopHeadLines();
    
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article))
    .toList();
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();

    
    
  }
  



}

