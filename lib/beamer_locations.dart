import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:test_navigation_new/author_details_screen.dart';
import 'package:test_navigation_new/authors_screen.dart';
import 'package:test_navigation_new/settings_screen.dart';

import 'articles_details_screen.dart';
import 'articles_screen.dart';
import 'book_details_screen.dart';
import 'book_screen.dart';

final beamerLocationBuilder = BeamerLocationBuilder(
  beamLocations: [
    BooksLocation(),
    ArticlesLocation(),
    AuthorLocation(),
    SettingsLocation(),
  ],
);

class BooksLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/books/:bookId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('books'),
          title: 'Books',
          type: BeamPageType.noTransition,
          child: BooksScreen(),
        ),
        if (state.pathParameters.containsKey('bookId'))
          BeamPage(
            key: ValueKey('book-${state.pathParameters['bookId']}'),
            title: books.firstWhere((book) => book['id'] == state.pathParameters['bookId'])['title'],
            child: BookDetailsScreen(
              book: books.firstWhere((book) => book['id'] == state.pathParameters['bookId']),
            ),
          ),
      ];
}

class ArticlesLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/articles/:articleId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('articles'),
          title: 'Articles',
          type: BeamPageType.noTransition,
          child: ArticlesScreen(),
        ),
        if (state.pathParameters.containsKey('articleId'))
          BeamPage(
            key: ValueKey('articles-${state.pathParameters['articleId']}'),
            title: articles.firstWhere((article) => article['id'] == state.pathParameters['articleId'])['title'],
            child: ArticleDetailsScreen(
              article: articles.firstWhere((article) => article['id'] == state.pathParameters['articleId']),
            ),
          ),
      ];
}

class AuthorLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/authors/:authorId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('authors'),
          title: 'Authors',
          type: BeamPageType.noTransition,
          child: AuthorsScreen(),
        ),
        if (state.pathParameters.containsKey('authorId'))
          BeamPage(
            key: ValueKey('author-${state.pathParameters['authorId']}'),
            title: authors.firstWhere((author) => author['id'] == state.pathParameters['authorId'])['author'],
            child: AuthorDetailsScreen(
              author: authors.firstWhere((author) => author['id'] == state.pathParameters['authorId']),
            ),
          ),
      ];
}

class SettingsLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/settings'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('settings'),
          title: 'Settings',
          type: BeamPageType.noTransition,
          child: SettingsScreen(),
        ),
        // if (state.pathParameters.containsKey('articleId'))
        //   BeamPage(
        //     key: ValueKey('articles-${state.pathParameters['articleId']}'),
        //     title: articles.firstWhere((article) => article['id'] == state.pathParameters['articleId'])['title'],
        //     child: ArticleDetailsScreen(
        //       article: articles.firstWhere((article) => article['id'] == state.pathParameters['articleId']),
        //     ),
        //   ),
      ];
}
