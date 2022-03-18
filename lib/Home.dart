import 'dart:convert';
import 'package:http/http.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:motivation/Api.dart';
import 'package:motivation/model.dart';

// Future<List<User>> getQuote() async {
//   Dio dio = Dio();
//   final response = await dio.get("https://zenquotes.io/api/quotes");
//   // ignore: prefer_typing_uninitialized_variables
//   if (response.statusCode == 200) {
//     return 
//   } else {
//     //SHOW ERROR MESSAGE
//   }
// }

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
    futureAlbum = Api.getQuote() ;
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
