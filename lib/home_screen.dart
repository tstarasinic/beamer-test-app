import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'beamer_locations.dart';
import 'bottom_navigation_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _beamerKey = GlobalKey<BeamerState>();
  final _routerDelegate = BeamerDelegate(locationBuilder: beamerLocationBuilder);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Beamer(
        key: _beamerKey,
        routerDelegate: _routerDelegate,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        beamerKey: _beamerKey,
      ),
    );
  }
}
