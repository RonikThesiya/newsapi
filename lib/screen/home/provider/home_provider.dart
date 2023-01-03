import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapi/screen/home/modal/IndiaNews.dart';
import 'package:newsapi/screen/home/modal/NewsModal.dart';

class HomeProvider extends ChangeNotifier
{

  int i = 0;
  String? topnewslink = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c06e77ab73e24e48aabfb6eae92ce383";


  String? selectdata = "health";


  void datachange(String newdata)
  {
    selectdata = newdata;
    notifyListeners();
  }

  void bottomindex(int index){
    i = index;
    notifyListeners();
  }

  Future<NewsModal> getnews()async
  {
    var newsjsonlink = await http.get(Uri.parse(topnewslink!));
    var linkdecode = jsonDecode(newsjsonlink.body);

    return NewsModal.fromJson(linkdecode);
  }

  Future<IndiaNews> indianewsmethod(String data) async {
    String? indianewslink = "https://saurav.tech/NewsAPI/top-headlines/category/$data/in.json";

    var indialink = await http.get(Uri.parse(indianewslink));
    var indialinkdecode = jsonDecode(indialink.body);

    return IndiaNews.fromJson(indialinkdecode);
  }
}