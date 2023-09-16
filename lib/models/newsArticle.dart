import 'dart:developer';

class NewsArticle{
  final String title;
  final String descriptioin;
  final String urlToImage;
  final String url;


  NewsArticle({required this.title,required this.descriptioin,required this.urlToImage,required this.url});


  factory NewsArticle.fromJSON(Map<String, dynamic> json){
    log(json["title"]);
    log(json["description"]);
     
     if(json["urlToImage"] == null)
     {
      json["urlToImage"] = "";
     }
     else{
      log(json["urlToImage"]);
     }
      log(json["url"]);
    return NewsArticle(
      
      title: json["title"],
      descriptioin: json["description"],
      urlToImage: json["urlToImage"],
      url: json["url"]
    );
  }
}