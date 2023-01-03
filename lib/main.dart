import 'package:flutter/material.dart';
import 'package:newsapi/screen/home/provider/home_provider.dart';
import 'package:newsapi/screen/home/view/bottombar_screens/news_profile.dart';
import 'package:newsapi/screen/home/view/bottombar_screens/news_video.dart';
import 'package:newsapi/screen/home/view/home_screen.dart';
import 'package:newsapi/screen/home/view/news_in_details.dart';
import 'package:newsapi/screen/home/view/tabbar_screen/buisness_news.dart';
import 'package:newsapi/screen/home/view/tabbar_screen/health_news.dart';
import 'package:newsapi/screen/home/view/tabbar_screen/india_news.dart';
import 'package:newsapi/screen/home/view/tabbar_screen/tabbar_news.dart';
import 'package:newsapi/screen/post/postPage.dart';
import 'package:newsapi/screen/post/postProvider.dart';
import 'package:newsapi/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PostProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash',
        routes: {
          '/': (context) => HomeScreen(),
          'video': (context) => VideoScreen(),
          'profile': (context) => ProfileScreen(),
          'top': (context) => TopNews(),
          'india': (context) => India(),
          'health': (context) => Health(),
          'business': (context) => Business(),
          'details': (context) => DetailsNews(),
          'splash': (context) => SplashScreen(),
          'post': (context) => PostPage(),
        },
      ),
    ),
  );
}
