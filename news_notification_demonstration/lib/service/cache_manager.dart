import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/news_model.dart';

class CacheManager {
  static const String CACHE_KEY = 'cached_news_articles';
  static const String LAST_MODIFIED_KEY = 'last_modified';

  Future<void> cacheArticles(List<NewsArticle> articles) async {
    final prefs = await SharedPreferences.getInstance();
    final String articlesJson = json.encode(
      articles.map((article) => article.toJson()).toList(),
    );
    await prefs.setString(CACHE_KEY, articlesJson);
  }

  Future<List<NewsArticle>> getCachedArticles() async {
    final prefs = await SharedPreferences.getInstance();
    final String? articlesJson = prefs.getString(CACHE_KEY);
    if (articlesJson != null) {
      final List<dynamic> decodedArticles = json.decode(articlesJson);
      return decodedArticles
          .map((json) => NewsArticle.fromJson(json))
          .toList();
    }
    return [];
  }

  Future<void> setLastModified(String lastModified) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(LAST_MODIFIED_KEY, lastModified);
  }

  Future<String?> getLastModified() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(LAST_MODIFIED_KEY);
  }
}