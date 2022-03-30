import 'package:flutter/material.dart';

class UpperScreen extends StatelessWidget {
  const UpperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upper'),
      ),
      body: const Text("Upper page, above everything"),
    );
  }
}
