// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class User {
  User({
    required this.q,
    required this.a,
    required this.c,
    required this.h,
  });

  String q;
  String a;
  String c;
  String h;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      q: json["q"],
      a: json["a"],
      c: json["c"],
      h: json["h"],
    );
  }
}
