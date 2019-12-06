import 'package:flutter/material.dart';
import "randomWord.dart";

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(number.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            number += 1;
          });
        },
      ),
    );
  }
}
