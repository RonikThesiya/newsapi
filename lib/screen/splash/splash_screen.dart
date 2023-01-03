import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapi/screen/home/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
        (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return HomeScreen();
        }));
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              "https://thumbs.dreamstime.com/b/news-sign-newspaper-icon-isolated-dark-background-simple-vector-logo-news-sign-newspaper-icon-isolated-dark-background-195402693.jpg"),

         SizedBox(height: 50,),
          Text("Make Your Self Update!!",style: TextStyle(color: Colors.white,fontSize: 20,decoration: TextDecoration.none),)
        ],
      ),
    );
  }
}
