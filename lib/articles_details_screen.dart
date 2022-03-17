import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({Key? key, required this.article}) : super(key: key);
  final Map<String, String> article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['title']!),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Author: ${article['author']!}'),
          ),
          TextButton(
            onPressed: () {
              Beamer.of(context).beamToNamed('/authors/${article['id']!}');
            },
            child: Text('To author:${article['author']!}'),
          )
        ],
      ),
    );
  }
}
