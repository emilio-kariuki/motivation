import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
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
final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
      ),
      body: Center(

          child: Visibility(
            visible: isLoaded,
            child: ListView.builder(
                  itemCount: _model?.length,
                  itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8,right: 8, bottom: 5),
              child: Container(
                padding : const EdgeInsets.all(10),
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Color.fromARGB(255, 19, 15, 26)),
                  color: Colors.grey,
                ),
                height: size.height * 0.15,
                child: Column(
                  children: [
                    Text(_model![index].q,style: GoogleFonts.roboto(fontSize: 20, color: Colors.black)),
                    Text(_model![index].a,),
                  ],
                ),
                // color: Colors.red,
              ),
            );
                  },
                ),
            replacement: const Center(child: CircularProgressIndicator()),
          )
      ),
    );
  }
}
