import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          const Text("Settings PAGE"),
          TextButton(
            onPressed: () {
              Beamer.of(context, root: true).beamToNamed('/upper');
            },
            child: const Text('Beam to upper page'),
          )
        ],
      ),
    );
  }
}
