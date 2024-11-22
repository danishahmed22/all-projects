import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../model/news_model.dart';
import 'news_card.dart';

class NewsCarousel extends StatelessWidget {
  final List<NewsArticle> articles;

  NewsCarousel({required this.articles});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: articles.length,
      itemBuilder: (context, index, realIndex) {
        final article = articles[index];
        return NewsCard(article: article);
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height,
        autoPlay: true,
        enableInfiniteScroll: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        pauseAutoPlayOnTouch: true,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
      ),
    );
  }
}
