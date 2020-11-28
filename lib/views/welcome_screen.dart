import 'package:flutter/material.dart';

import 'package:News/news/news_helpers.dart';
import 'package:News/views/home_screen.dart';

TextEditingController _apiKey = TextEditingController();
NewsHelpers _helpers = NewsHelpers();

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  static const String news_icon_240 = 'assets/news_240.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(news_icon_240),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your API key!',
                  prefixIcon: Icon(Icons.vpn_key),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                obscureText: true,
                controller: _apiKey,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        elevation: 0.0,
        onPressed: () {
          _helpers.storeApiKey(_apiKey.text);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homescreen(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
