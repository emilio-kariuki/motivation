import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:motivation/model.dart';

Future<Map<String, dynamic>> getQuote() async {
  Dio dio = Dio();

  final response = await dio.get('https://zenquotes.io/api/quotes');
  // List responseJson = json.decode(response.data);
  Map<String, dynamic> data = jsonDecode(response.data);
  print(data);
  return data;
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
    futureAlbum = getQuote() as Future<User> ;
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
