import 'package:flutter/material.dart';
import 'package:smd_investments_website/views/home.dart';
import 'package:smd_investments_website/views/about.dart';
import 'package:smd_investments_website/views/principles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kua Capital',
      routes: {
        '/home': (context) => HomePage(),
        '/about' : (context) => AboutUsPage(),
        '/principles': (context) => PrinciplesPage(),
      },
      home: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Colors.lightBlue,
          primaryColor: Colors.lightBlue
        ),
        child: Builder(
          builder: (context) => HomePage(),
        ),
      ),
    );
  }
}