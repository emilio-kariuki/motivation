import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:motivation/Api.dart';
import 'package:motivation/model.dart';

Future<List<Map<String, dynamic>>> getQuote() async {
  final response = await http.get(Uri.parse("https://zenquotes.io/api/quotes"));

  if (response.statusCode == 200) {
    // If the server returns an OK response, then parse the JSON.
    List<Map<String, dynamic>> map = [];
    map = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    return map;
    // var extractedData =
    //     List<Map<String, dynamic>>.from(jsonDecode(response.body));
    // return extractedData;
  } else {
    // If the response was umexpected, throw an error.
    throw Exception('Failed to load post');
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<User> user;
  @override
  void initState() {
    super.initState();
    user = getQuote() as Future<User>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.q);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
