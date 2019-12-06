import 'package:flutter/material.dart';
import "randomWord.dart";

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
        ),
        body: RandomWord(),
      ),
    );
  }
}
