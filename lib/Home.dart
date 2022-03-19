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
  List<User>? _model;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    // _model = Api().getQuote();
    getData();
  }

  getData() async {
    _model = await Api().getQuote();
    if (_model != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        
          child: Visibility(
            visible: isLoaded,
            child: ListView.builder(
                  itemCount: _model?.length,
                  itemBuilder: (context, index) {
            return Container(
              height: 50,
              child: Text(_model![index].q,),
              // color: Colors.red,
            );
                  },
                ),
            replacement: const Center(child: CircularProgressIndicator()),
          )
      ),
    );
  }
}
