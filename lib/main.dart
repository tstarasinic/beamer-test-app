import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:test_navigation_new/home_screen.dart';

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    initialPath: '/books',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '*': (context, state, data) => HomeScreen(),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
    );
  }
}

void main() {
  Beamer.setPathUrlStrategy();
  runApp(MyApp());
}
