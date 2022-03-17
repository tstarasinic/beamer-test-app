import 'package:beamer/src/beamer.dart';
import 'package:flutter/material.dart';

const List<Map<String, String>> books = [
  {
    'id': '1',
    'title': 'Stranger in a Strange Land',
    'author': 'Robert A. Heinlein',
    'authorId': '1',
  },
  {
    'id': '2',
    'title': 'Foundation',
    'author': 'Isaac Asimov',
    'authorId': '2',
  },
  {
    'id': '3',
    'title': 'Fahrenheit 451',
    'author': 'Ray Bradbury',
    'authorId': '3',
  },
];

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: ListView(
        children: books
            .map(
              (book) => ListTile(
                title: Text(book['title']!),
                subtitle: Text(book['author']!),
                onTap: () => context.beamToNamed('/books/${book['id']}'),
              ),
            )
            .toList(),
      ),
    );
  }
}
