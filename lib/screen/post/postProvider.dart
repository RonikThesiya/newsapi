import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostProvider extends ChangeNotifier {
  String apilink = "https://reqres.in/api/users";

  Future<bool> postApi(String name, String job) async {
    var jsonString = await http
        .post(Uri.parse(apilink), body: {"name": "$name", "job": "$job"});
    // var json = jsonDecode(jsonString.body);
    if (jsonString.statusCode >= 200 && jsonString.statusCode < 400) {
      return true;
    } else {
      return false;
    }
  }
}
