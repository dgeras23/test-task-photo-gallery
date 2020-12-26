import 'package:flutter/material.dart';
import 'package:test_task1/screens/loading_screen.dart';
import 'package:test_task1/utilities/constants.dart';

void main() {
  runApp(EntryPoint());
}

class EntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        accentColor: kAccentColor,
      ),
      home: LoadingScreen(),
    );
  }
}
