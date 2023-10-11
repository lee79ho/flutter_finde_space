import 'package:flutter/material.dart';

import 'package:freash_news/pages/incident_list_page.dart';
import 'package:freash_news/viewmodels/incident_list_view_model.dart';
import 'package:freash_news/viewmodels/newArticleListViewModel.dart';
import 'package:freash_news/pages/newsListPage.dart';
import 'package:provider/provider.dart';



void main() => runApp(App());

class App extends StatelessWidget{
 
  @override
  Widget build(BuildContext context){

    // return MaterialApp(
    //   home: HomePage());
    // return MaterialApp(
    //   title: "Fresh Nes",
    //   home: ChangeNotifierProvider(
    //     create: (_) => NewsArticleListViewModel(),
    //     //builder: (_) => NewsArticleListViewModel(),
    //     child: NewsListPage()
    //   )
    // );

    return MaterialApp(
      title: "City Care",
      home:
      ChangeNotifierProvider(
        create: (context) => IncidentListViewModel(),
        child: IncidentListPage()
      )
    );
  }
}
