import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:test_navigation_new/beam_locations.dart';
import 'package:test_navigation_new/home_screen.dart';

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    initialPath: '/books',
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [OuterBeamLocation()],
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
