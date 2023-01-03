import 'package:flutter/material.dart';
import 'package:newsapi/screen/home/view/tabbar_screen/buisness_news.dart';
import 'package:newsapi/screen/home/view/tabbar_screen/entertainment_news.dart';
import 'package:newsapi/screen/home/view/tabbar_screen/health_news.dart';
import 'package:newsapi/screen/home/view/tabbar_screen/india_news.dart';
import 'package:newsapi/screen/home/view/tabbar_screen/tabbar_news.dart';

class NewsHomeScreen extends StatefulWidget {
  const NewsHomeScreen({Key? key}) : super(key: key);

  @override
  State<NewsHomeScreen> createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(child: Scaffold(
        body: Column(
          children: [
            TabBar(isScrollable: true,tabs:
            [
              Tab(child: Text("TOP NEWS")),
              Tab(child: Text("INDIA")),
              Tab(child: Text("HEALTH")),
              Tab(child: Text("BUSINESS")),
              Tab(child: Text("ENTERTAINMENT")),

            ]
            ),

            Expanded(
              child: TabBarView(children:
              [
                TopNews(),
                India(),
                Health(),
                Business(),
                Entertainment(),
              ]
              ),
            ),
          ],
        ),
      )),
    );
  }
}
