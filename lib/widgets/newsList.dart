import 'package:flutter/material.dart';
import 'package:freash_news/pages/NewsArticleDetailsPage.dart';
import 'package:freash_news/viewmodels/newsArticleViewModel.dart';


class NewsList extends StatelessWidget{

  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;

  NewsList({ required this.articles , required this.onSelected});



  @override
  Widget build(BuildContext context){

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index){

        final article = articles[index];

        return ListTile(
          onTap: (){
            
            this.onSelected(article);
           
          },
          leading: Container(
          width: 100, 
          height: 100,
          child: article.imageURL == 
          null ? Image.asset("images/news-placeholder.png")
          : Image.network(article.imageURL)),
        title: Text(article.title),
        );
      },
    );


  }


  
}