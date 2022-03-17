import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'beamer_locations.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key, required this.beamerKey}) : super(key: key);

  final GlobalKey<BeamerState> beamerKey;

  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late BeamerDelegate _beamerDelegate;
  int _currentIndex = 0;

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
  }

  void updateIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // _currentIndex = 0;

    return BottomNavigationBar(
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
        BottomNavigationBarItem(label: 'Articles', icon: Icon(Icons.article)),
        BottomNavigationBarItem(label: 'Authors', icon: Icon(Icons.person)),
        BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),
      ],
      onTap: (index) {
        if (index == 0) _beamerDelegate.beamToNamed('/books');
        if (index == 1) _beamerDelegate.beamToNamed('/articles');
        if (index == 2) _beamerDelegate.beamToNamed('/authors');
        if (index == 3) _beamerDelegate.beamToNamed('/settings');
        updateIndex(index);
      },
    );
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }
}
