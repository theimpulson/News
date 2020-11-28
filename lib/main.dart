import 'package:flutter/material.dart';

import 'package:News/news/news_helpers.dart';
import 'package:News/views/welcome_screen.dart';
import 'package:News/views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        // Show appropriate screen depending on status of API
        future: NewsHelpers().apiKeyExists(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data ? Homescreen() : WelcomeScreen();
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
