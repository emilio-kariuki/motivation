// ignore_for_file: unused_import, deprecated_member_use, unused_local_variable, avoid_init_to_null

import 'dart:convert';
import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:motivation/model.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<User> getQuote() async {
    final response =
        await http.get(Uri.parse("https://zenquotes.io/api/quotes"));
    var userModel = null;

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      userModel = User.fromJson(jsonMap);
      return userModel;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
