import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../background_notification_service.dart';
import 'card.dart';

class NewsCarousel extends StatefulWidget {
  @override
  _NewsCarouselState createState() => _NewsCarouselState();
}

class _NewsCarouselState extends State<NewsCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  List<dynamic> articles = [];
  Timer? _timer;
  int _currentPage = 0;
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchNews();
    startCarouselTimer();
    startPeriodicNotification();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void startCarouselTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < articles.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  void startPeriodicNotification() {
    Timer.periodic(Duration(seconds: 30), (timer) {
      showNotification();
    });
  }

  Future<void> fetchNews() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final response = await http.get(Uri.parse(
          'https://api.thenewsapi.com/v1/news/all?api_token=EH66zodt1oQUeW8lhvgbA9vjq6b5qLjYT26YIoNV&language=en'));

      if (response.statusCode == 200) {
        setState(() {
          articles = json.decode(response.body)['data'];
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load news. Please try again later.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _errorMessage.isNotEmpty
                ? Center(child: Text(_errorMessage))
                : PageView.builder(
              controller: _pageController,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return NewsCard(article: articles[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}