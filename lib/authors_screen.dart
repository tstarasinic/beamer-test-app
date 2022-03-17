import 'package:beamer/src/beamer.dart';
import 'package:flutter/material.dart';

const List<Map<String, String>> authors = [
  {
    'id': '1',
    'author': 'Robert A. Heinlein',
    'publisher': 'Beamer 4',
    'title': 'Stranger in a Strange Land',
  },
  {
    'id': '2',
    'author': 'Isaac Asimov',
    'publisher': 'Beamer 5',
    'title': 'Foundation',
  },
  {
    'id': '3',
    'author': 'Ray Bradbury',
    'publisher': 'Beamer 6',
    'title': 'Fahrenheit 451',
  },
  {
    'id': '4',
    'author': 'Toby Lewis',
    'publisher': 'Beamer',
    'title': 'Explaining Flutter Nav 2.0 and Beamer',
  },
  {
    'id': '5',
    'author': 'Lulupointu',
    'publisher': 'Beamer 2',
    'title': 'Flutter Navigator 2.0 for mobile dev: 101',
  },
  {
    'id': '6',
    'author': 'Marco Muccinelli',
    'publisher': 'Beamer 3',
    'title': 'Flutter: An Easy and Pragmatic Approach to Navigator 2.0',
  },
];

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Authors')),
      body: ListView(
        children: authors
            .map(
              (author) => ListTile(
                title: Text(author['author']!),
                subtitle: Text(author['publisher']!),
                onTap: () => context.beamToNamed('/authors/${author['id']}'),
              ),
            )
            .toList(),
      ),
    );
  }
}
