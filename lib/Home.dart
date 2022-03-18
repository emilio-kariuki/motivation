import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:motivation/Api.dart';
import 'package:motivation/model.dart';

Future<User> getQuote() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

    if (response.statusCode == 200) {
      // If the server returns an OK response, then parse the JSON.
      return User.fromJson(json.decode(response.body));
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
  late Future<User> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = getQuote() ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("snapshot.data");  
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
