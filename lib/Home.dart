import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:motivation/Api.dart';
import 'package:motivation/model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<User>? _model;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    _model = Api().getQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
          child: FutureBuilder(
        future: _model,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemBuilder: (context, index) {
              return Container(
                height: 100,
                color: Colors.red,
              );
            });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      )),
    );
  }
}
