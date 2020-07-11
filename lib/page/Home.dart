import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Text('Hi Everyone'),
    );
  }
// #enddocregion build
}