// ignore_for_file: unused_import, deprecated_member_use

import 'dart:convert';
import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:motivation/model.dart';
import 'package:http/http.dart' as http;

class Api {
  void getQuote() async {
    final response =
        await http.get(Uri.parse("https://zenquotes.io/api/quotes"));
    List<User> postList = <User>[];

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      User.fromJson(jsonMap);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
