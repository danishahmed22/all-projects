// lib/screens/news_home_page.dart
import 'package:flutter/material.dart';

import '../model/news_model.dart';
import '../service/api_service.dart';
import '../widget/news_carousel.dart';


class NewsHomePage extends StatefulWidget {
  @override
  _NewsHomePageState createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  late NewsService _newsService;
  late Future<List<NewsArticle>> _futureNews;

  @override
  void initState() {
    super.initState();
    _newsService = NewsService();
    _futureNews = _newsService.getNews();
  }

  Future<void> _refreshNews() async {
    setState(() {
      _futureNews = _newsService.refreshNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshNews,
        child: FutureBuilder<List<NewsArticle>>(
          future: _futureNews,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Failed to load news'));
            } else if (snapshot.hasData) {
              return NewsCarousel(articles: snapshot.data!);
            } else {
              return Center(child: Text('No news available'));
            }
          },
        ),
      ),
    );
  }
}