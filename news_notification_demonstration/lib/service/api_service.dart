import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/news_model.dart';
import 'cache_manager.dart';

class NewsService {
  final String _baseUrl = 'https://api.thenewsapi.com/v1/news/all';
  final String _apiKey = 'EH66zodt1oQUeW8lhvgbA9vjq6b5qLjYT26YIoNV';
  final CacheManager _cacheManager = CacheManager();

  Future<List<NewsArticle>> getNews() async {
    final cachedArticles = await _cacheManager.getCachedArticles();
    if (cachedArticles.isNotEmpty) {
      return cachedArticles;
    }
    return await fetchAndCacheNews();
  }

  Future<List<NewsArticle>> fetchAndCacheNews() async {
    final lastModified = await _cacheManager.getLastModified();
    final response = await http.get(
      Uri.parse('$_baseUrl?api_token=$_apiKey&language=en'),
      headers: lastModified != null ? {'If-Modified-Since': lastModified} : {},
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      List<NewsArticle> articles = jsonResponse.map((data) => NewsArticle.fromJson(data)).toList();

      await _cacheManager.cacheArticles(articles);
      await _cacheManager.setLastModified(response.headers['last-modified'] ?? '');

      return articles;
    } else if (response.statusCode == 304) {
      // Content not modified, return cached data
      return await _cacheManager.getCachedArticles();
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<void> refreshNews() async {
    await fetchAndCacheNews();
  }
}