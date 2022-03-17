import 'package:beamer/src/beamer.dart';
import 'package:flutter/material.dart';

const List<Map<String, String>> articles = [
  {
    'id': '4',
    'title': 'Explaining Flutter Nav 2.0 and Beamer',
    'author': 'Toby Lewis',
    'authorId': '4',
  },
  {
    'id': '5',
    'title': 'Flutter Navigator 2.0 for mobile dev: 101',
    'author': 'Lulupointu',
    'authorId': '5',
  },
  {
    'id': '6',
    'title': 'Flutter: An Easy and Pragmatic Approach to Navigator 2.0',
    'author': 'Marco Muccinelli',
    'authorId': '6',
  },
];

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Articles')),
      body: ListView(
        children: articles
            .map(
              (article) => ListTile(
                title: Text(article['title']!),
                subtitle: Text(article['author']!),
                onTap: () => context.beamToNamed('/articles/${article['id']}'),
              ),
            )
            .toList(),
      ),
    );
  }
}
