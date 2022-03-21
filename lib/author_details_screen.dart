import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class AuthorDetailsScreen extends StatelessWidget {
  const AuthorDetailsScreen({Key? key, required this.author}) : super(key: key);
  final Map<String, String> author;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(author['author']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Author: ${author['author']!}'),
            Text('Book: ${author['title']!}'),
            Text('Publisher: ${author['publisher']!}'),
            TextButton(
              onPressed: () {
                if (int.parse(author['id']!) < 4) {
                  Beamer.of(context).beamToNamed('/books/${author['id']!}');
                } else {
                  Beamer.of(context).beamToNamed('/articles/${author['id']!}');
                }
              },
              child: Text('To Book:${author['title']!}'),
            )
          ],
        ),
      ),
    );
  }
}
