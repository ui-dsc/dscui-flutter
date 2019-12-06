import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; // Add this line.

class RandomWord extends StatefulWidget {
  RandomWord({Key key}) : super(key: key);

  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  String wordpair = WordPair.random(maxSyllables: 2).asPascalCase;

  List<WordPair> _suggestions = <WordPair>[];

  List<WordPair> _saved = <WordPair>[];

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
    bool alreadySaved = _saved.contains(wp);

    return Center(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              wp.asPascalCase,
            ),
            Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ],
        ),
        onTap: () {
          setState(() {
            alreadySaved ? _saved.remove(wp) : _saved.add(wp);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestion();
  }
}
