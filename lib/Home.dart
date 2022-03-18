

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:motivation/model.dart';

Future<User> getQuote() async {
    Dio dio = Dio();

    final response = await dio.get('https://zenquotes.io/api/quotes');
    // List responseJson = json.decode(response.data);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // Map responseBody = response.data;
      // List jsonResponse = json.decode(response.data);
      // List responseJson = json.decode(response.data);
      return User.fromJson(response.data);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
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
    futureAlbum = getQuote();
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
