import 'package:flutter/material.dart';
import 'package:startup_project/HomepageScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: HomepageScreen(),
    );
  }
}
