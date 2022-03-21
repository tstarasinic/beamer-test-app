import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'beam_locations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _beamerDelegates = [
    BeamerDelegate(
      initialPath: InnerBeamLocation.booksPath,
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [InnerBeamLocation(InnerBeamLocation.booksPath)],
      ),
    ),
    BeamerDelegate(
      initialPath: InnerBeamLocation.articlesPath,
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [InnerBeamLocation(InnerBeamLocation.articlesPath)],
      ),
    ),
    BeamerDelegate(
      initialPath: InnerBeamLocation.authorsPath,
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [InnerBeamLocation(InnerBeamLocation.authorsPath)],
      ),
    ),
    BeamerDelegate(
      initialPath: InnerBeamLocation.settingsPath,
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [InnerBeamLocation(InnerBeamLocation.settingsPath)],
      ),
    ),
  ];

  late int _currentIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final beamState = Beamer.of(context).currentBeamLocation.state as BeamState;
    _currentIndex = getCurrentIndex(beamState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Beamer(routerDelegate: _beamerDelegates[0]),
          Beamer(routerDelegate: _beamerDelegates[1]),
          Beamer(routerDelegate: _beamerDelegates[2]),
          Beamer(routerDelegate: _beamerDelegates[3]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: 'Books',
            icon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            label: 'Articles',
            icon: Icon(Icons.article),
          ),
          BottomNavigationBarItem(
            label: 'Authors',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
        onTap: (index) {
          if (index == _currentIndex) {
            final beamLocation = _beamerDelegates[_currentIndex]
                .currentBeamLocation as InnerBeamLocation;
            beamLocation.updateToHome();
          } else {
            setState(() => _currentIndex = index);
            _beamerDelegates[_currentIndex].update(rebuild: false);
          }
        },
      ),
    );
  }

  int getCurrentIndex(BeamState beamState) {
    final firstPathSegment = '/' + beamState.uri.pathSegments.first;
    switch (firstPathSegment) {
      case InnerBeamLocation.booksPath:
        return 0;
      case InnerBeamLocation.articlesPath:
        return 1;
      case InnerBeamLocation.authorsPath:
        return 2;
      case InnerBeamLocation.settingsPath:
        return 3;
      default:
        return 0;
    }
  }
}
