// ignore_for_file: unused_import, deprecated_member_use

import 'dart:convert';
import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:motivation/model.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<User>> getQuote() async {
    final response =
        await http.get(Uri.parse("https://zenquotes.io/api/quotes"));
    List<User> postList = <User>[];

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> values = <dynamic>[];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            postList.add(User.fromJson(map));
            debugPrint('Id-------${map['id']}');
          }
        }
      }
      print("THis is postlist $postList");
      return postList;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
