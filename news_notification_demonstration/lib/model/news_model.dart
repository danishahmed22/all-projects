// lib/models/news_article.dart
class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;
  final String snippet;

  NewsArticle({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.snippet,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'snippet': snippet,
    };
  }
}
