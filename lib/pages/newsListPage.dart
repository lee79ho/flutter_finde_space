import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freash_news/pages/NewsArticleDetailsPage.dart';
import 'package:freash_news/viewmodels/newArticleListViewModel.dart';
import 'package:freash_news/viewmodels/newsArticleViewModel.dart';
import 'package:freash_news/widgets/newsList.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

class NewsListPage extends StatefulWidget{
  @override
  _NewsListPageState createState() => _NewsListPageState();

}
class _NewsListPageState extends State<NewsListPage> {
TextEditingController _controller = new TextEditingController();

  @override
  void initState(){
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
    .populateTopHeadlines();
      log('initState');
  }
 
   void _showNewsArticleDetails(BuildContext context, NewsArticleViewModel article){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => NewsArticleDetailsPage(article: article)
    ));
  }

  Widget _buildList(BuildContext context, NewsArticleListViewModel vm){

    switch(vm.loadingStatus){
      case LoadingStatus.searching:
      return Align(child: CircularProgressIndicator());
      case LoadingStatus.empty:
      return Align(child: Text("No results found!"));
      case LoadingStatus.completed:
      return Expanded(child: NewsList(
        articles: vm.articles,
        onSelected: (article){
          _showNewsArticleDetails(context, article);
        },
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
      title: Text("Top News")
    ),
    body: Column(children: <Widget>[
      TextField(
        controller: _controller,
        onSubmitted: (value) {

          if(value.isNotEmpty){
            vm.search(value);
          }
          // fetch all the news related to the keyword
        },
        decoration: InputDecoration(
          labelText: "Enter search term",
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: (){
            _controller.clear();
            },
          )

        ),
      ),
      _buildList(context, vm)

    ])
    
    
    // ListView.builder(
    // itemCount: vm.articles.length,
    // itemBuilder: (context, index){
    //   log('itemCount: $vm.articles.length');
    //   final article = vm.articles[index];

    //   return ListTile(
    //     leading: Container(
    //       width: 100,
    //       height: 100,
    //       child: article.imageURL == null ? Image.asset("images/news-placeholder.png") : Image.network(article.imageURL)),
    //   title: Text(article.title),
    // );
    // },
    // )
    );

  }
}
