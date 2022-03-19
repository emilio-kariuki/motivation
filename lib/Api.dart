import 'dart:convert';
import "package:flutter/material.dart";
import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:motivation/model.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<User> getQuote() async {
    final response = await http.get(Uri.parse("https://zenquotes.io/api/quotes"));

    if (response.statusCode == 200) {
      // If the server returns an OK response, then parse the JSON.
      
      return User.fromJson(json.decode(response.body));
    } else {
      // If the response was umexpected, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
