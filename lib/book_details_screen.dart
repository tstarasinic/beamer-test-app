import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({Key? key, required this.book}) : super(key: key);
  final Map<String, String> book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book['title']!),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Author: ${book['author']!}'),
          ),
          TextButton(
            onPressed: () {
              Beamer.of(context).beamToNamed('/authors/${book['authorId']!}');
            },
            child: Text('To author: ${book['author']!}'),
          )
        ],
      ),
    );
  }
}
