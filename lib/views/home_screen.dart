import 'package:News/news/news_helpers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: NewsHelpers().fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot == null ? 0 : snapshot.data.length,
                itemBuilder: (context, index) {
                  String title = snapshot.data[index]['title'];
                  String description = snapshot.data[index]['description'];
                  String url = snapshot.data[index]['url'];
                  String urlToImage = snapshot.data[index]['urlToImage'];
                  String source = snapshot.data[index]['source']['name'];

                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: InkWell(
                        onTap: () async {
                          return await launch(url);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Image.network(
                                urlToImage,
                                width: 350,
                                height: 200,
                                fit: BoxFit.fill,
                              ),
                              Text(''),
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(description),
                              Text(''),
                              Row(
                                children: <Widget>[
                                  Text(
                                    source,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return Container(
              alignment: AlignmentDirectional.center,
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
