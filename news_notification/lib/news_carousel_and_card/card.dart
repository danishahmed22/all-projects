import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final dynamic article;

  NewsCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: CachedNetworkImage(
                imageUrl: article['image_url'] ?? '',
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                article['title'] ?? 'No Title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                article['snippet'] ?? 'No snippet available',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}