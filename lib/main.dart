import 'package:flutter/material.dart';
import 'package:smd_investments_website/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMD Global Investments',
      home: SafeArea(
        child: HomePage(),
      ),
    );
  }
}