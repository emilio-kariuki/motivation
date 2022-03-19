// ignore_for_file: unused_import

import 'dart:convert';
import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:motivation/model.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<User>> getQuote() async {
  final response = await http.get(Uri.parse("https://zenquotes.io/api/quotes"));

  if (response.statusCode == 200) {
    
    final jsonResponse = json.decode(response.body);
    final paymentList = jsonResponse['datos'] as List;
    return paymentList.map((data) => User.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load post');
  }
}
}
