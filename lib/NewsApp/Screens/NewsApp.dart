import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:start/NewsApp/Jsons/Network.dart';
import '../Jsons/Json.dart';
import '../Widgets/FutureBuilder.dart';

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  Future<News> datai;
  int value = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datai = new Network(
            "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f6044640d16f4b69a3332b7fed961f72")
        .getData();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NewsApp",
          style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade400,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        selectedItemColor: Colors.transparent,
        unselectedItemColor: Colors.transparent,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.military_tech,
                  color: value == 0 ? Colors.cyan : Colors.black54),
              title: Text(
                "Technology",
                style:
                    TextStyle(color: value == 0 ? Colors.cyan : Colors.black54),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: value == 1 ? Colors.cyan : Colors.black54),
              title: Text("Home",
                  style: TextStyle(
                      color: value == 1 ? Colors.cyan : Colors.black54))),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.appStore,
                  color: value == 2 ? Colors.cyan : Colors.black54),
              title: Text("Apple",
                  style: TextStyle(
                      color: value == 2 ? Colors.cyan : Colors.black54)))
        ],
        onTap: (int i) {
          value = i;
          setState(() {
            if (i == 0) {
              datai = Network(
                      "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f6044640d16f4b69a3332b7fed961f72")
                  .getData();
            } else if (i == 1)
              datai = Network(
                      "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f6044640d16f4b69a3332b7fed961f72")
                  .getData();
            else
              datai = Network(
                      "http://newsapi.org/v2/everything?q=apple&from=2020-10-14&to=2020-10-14&sortBy=popularity&apiKey=f6044640d16f4b69a3332b7fed961f72")
                  .getData();
          });
        },
      ),
      body: Center(
        child: app(datai),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh_rounded),
      ),
    );
  }
}
