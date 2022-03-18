// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

// List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

// String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

    factory User.fromJson(Map<String, dynamic> json) => User(
        q: json["q"],
        a: json["a"],
        c: json["c"],
        h: json["h"],
    );

    Map<String, dynamic> toJson() => {
        "q": q,
        "a": a,
        "c": c,
        "h": h,
    };
}
