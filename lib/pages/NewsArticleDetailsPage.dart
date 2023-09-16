
import 'package:flutter/material.dart';
import 'package:freash_news/viewmodels/newsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailsPage extends StatefulWidget{

  final NewsArticleViewModel article;

  NewsArticleDetailsPage({required this.article});
  
  

  @override
  State<NewsArticleDetailsPage> createState() => _WebviewPageState(article);



  
 
}

class _WebviewPageState extends State<NewsArticleDetailsPage> {
  WebViewController? _controller;
final NewsArticleViewModel article;

_WebviewPageState(this.article);

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(this.article.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text("${this.article.title}"),
          actions: const [],
        ),
        body: WebViewWidget(controller: _controller!));
  }
}