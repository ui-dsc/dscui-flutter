import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class RandomWord extends StatefulWidget {
  RandomWord({Key key}) : super(key: key);

  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  String wordpair = WordPair.random(maxSyllables: 2).asPascalCase;

  List<WordPair> _suggestions = <WordPair>[];

  Widget _buildSuggestion() {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }

        int index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair wp) {
    return Center(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              wp.asPascalCase,
            ),
            Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestion();
  }
}

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
