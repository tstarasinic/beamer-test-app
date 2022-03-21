import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:test_navigation_new/author_details_screen.dart';
import 'package:test_navigation_new/authors_screen.dart';
import 'package:test_navigation_new/home_screen.dart';
import 'package:test_navigation_new/settings_screen.dart';
import 'package:test_navigation_new/upper_screen.dart';

import 'articles_details_screen.dart';
import 'articles_screen.dart';
import 'book_details_screen.dart';
import 'book_screen.dart';

class OuterBeamLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final hasUpper = state.pathPatternSegments.contains('upper');
    final homeKeyString = hasUpper && history.length > 1
        ? history[history.length - 2].routeInformation.location
        : state.routeInformation.location;
    return [
      BeamPage(
        key: ValueKey(homeKeyString),
        child: const HomeScreen(),
      ),
      if (state.pathPatternSegments.contains('upper'))
        BeamPage(
          key: const ValueKey('upper'),
          child: const UpperScreen(),
          onPopPage: (context, delegate, state, page) {
            {
              if (delegate.currentBeamLocation.history.length > 1) {
                return BeamPage.routePop(context, delegate, state, page);
              }
              delegate.update(
                configuration: const RouteInformation(location: '/books'),
                rebuild: false,
              );
              return true;
            }
          },
        ),
    ];
  }
}

class InnerBeamLocation extends BeamLocation<BeamState> {
  InnerBeamLocation(this.home);

  final String home;

  static const String booksPath = '/books';
  static const String articlesPath = '/articles';
  static const String authorsPath = '/authors';
  static const String settingsPath = '/settings';
  static const String bookDetailsPath = '/books/:bookId';
  static const String articlesDetailsPath = '/articles/:articleId';
  static const String authorsDetailsPath = '/authors/:authorId';

  @override
  List<Pattern> get pathPatterns => [
        home,
        bookDetailsPath,
        articlesDetailsPath,
        authorsDetailsPath,
      ];

  void updateToHome() => update(null, RouteInformation(location: home));

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final bookId = state.pathParameters['bookId'];
    final articleId = state.pathParameters['articleId'];
    final authorId = state.pathParameters['authorId'];
    return [
      _homePage,
      if (bookId != null)
        BeamPage(
          key: ValueKey('book-$bookId'),
          title: books.firstWhere((book) => book['id'] == bookId)['title'],
          child: BookDetailsScreen(
            book: books.firstWhere((book) => book['id'] == bookId),
          ),
          onPopPage: _onPopPage,
        ),
      if (articleId != null)
        BeamPage(
          key: ValueKey('articles-$articleId'),
          title: articles
              .firstWhere((article) => article['id'] == articleId)['title'],
          child: ArticleDetailsScreen(
            article:
                articles.firstWhere((article) => article['id'] == articleId),
          ),
          onPopPage: _onPopPage,
        ),
      if (authorId != null)
        BeamPage(
          key: ValueKey('author-$authorId'),
          title: authors
              .firstWhere((author) => author['id'] == authorId)['author'],
          child: AuthorDetailsScreen(
            author: authors.firstWhere((author) => author['id'] == authorId),
          ),
          onPopPage: _onPopPage,
        ),
    ];
  }

  BeamPage get _homePage {
    switch (home) {
      case booksPath:
        return const BeamPage(
          key: ValueKey('books'),
          title: 'Books',
          child: BooksScreen(),
        );

      case articlesPath:
        return const BeamPage(
          key: ValueKey('articles'),
          title: 'Articles',
          child: ArticlesScreen(),
        );

      case authorsPath:
        return const BeamPage(
          key: ValueKey('authors'),
          title: 'Authors',
          child: AuthorsScreen(),
        );

      case settingsPath:
        return const BeamPage(
          key: ValueKey('settings'),
          title: 'Settings',
          child: SettingsScreen(),
        );

      default:
        return const BeamPage(
          key: ValueKey('books'),
          title: 'Books',
          type: BeamPageType.noTransition,
          child: BooksScreen(),
        );
    }
  }

  bool _onPopPage(
    BuildContext context,
    BeamerDelegate delegate,
    RouteInformationSerializable state,
    BeamPage page,
  ) {
    if (delegate.currentBeamLocation.history.length > 1) {
      delegate.update(
        beamParameters: const BeamParameters(
            transitionDelegate: ReverseTransitionDelegate()),
        rebuild: false,
      );
      return BeamPage.routePop(context, delegate, state, page);
    }
    delegate.update(
      configuration: RouteInformation(location: home),
      rebuild: false,
    );
    return true;
  }
}
