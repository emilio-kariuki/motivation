import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:motivation/model.dart';

Future<User> getQuote() async {
    Dio dio = Dio();

    final response = await dio.get('https://zenquotes.io/api/quotes');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
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
    return Container();
  }
}
