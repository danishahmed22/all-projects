import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financial Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewsSection(),
              SizedBox(height: 20),
              SectorSection(),
              SizedBox(height: 20),
              CompanySection(),
              SizedBox(height: 20),
              DatesSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Latest News', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            NewsItem(title: 'Market Rally Continues', source: 'Financial Times'),
            NewsItem(title: 'Tech Stocks Surge', source: 'Wall Street Journal'),
            NewsItem(title: 'Fed Announces Rate Decision', source: 'Bloomberg'),
          ],
        ),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final String title;
  final String source;

  NewsItem({required this.title, required this.source});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.article, color: Colors.blue),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(source, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectorSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sector Performance', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            SectorItem(name: 'Technology', performance: 2.5),
            SectorItem(name: 'Healthcare', performance: -0.8),
            SectorItem(name: 'Finance', performance: 1.2),
          ],
        ),
      ),
    );
  }
}

class SectorItem extends StatelessWidget {
  final String name;
  final double performance;

  SectorItem({required this.name, required this.performance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Text(
            '${performance.toStringAsFixed(2)}%',
            style: TextStyle(
              color: performance >= 0 ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class CompanySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Top Companies', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            CompanyItem(name: 'Apple Inc.', ticker: 'AAPL', price: 150.25),
            CompanyItem(name: 'Microsoft Corp.', ticker: 'MSFT', price: 280.75),
            CompanyItem(name: 'Amazon.com Inc.', ticker: 'AMZN', price: 3200.50),
          ],
        ),
      ),
    );
  }
}

class CompanyItem extends StatelessWidget {
  final String name;
  final String ticker;
  final double price;

  CompanyItem({required this.name, required this.ticker, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(ticker, style: TextStyle(color: Colors.grey)),
            ],
          ),
          Text(
            '\$${price.toStringAsFixed(2)}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class DatesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Important Dates', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            DateItem(event: 'Q2 Earnings Report', date: DateTime(2023, 7, 15)),
            DateItem(event: 'Annual Shareholder Meeting', date: DateTime(2023, 8, 1)),
            DateItem(event: 'Economic Data Release', date: DateTime(2023, 7, 28)),
          ],
        ),
      ),
    );
  }
}

class DateItem extends StatelessWidget {
  final String event;
  final DateTime date;

  DateItem({required this.event, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(event),
          Text(
            DateFormat('MMM d, yyyy').format(date),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}