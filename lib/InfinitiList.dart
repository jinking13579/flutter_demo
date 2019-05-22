import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class InfinitiListState extends State<InfinitiList> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = Set<WordPair>();

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(pair.asCamelCase, style: _biggerFont),
      trailing: Icon(alreadySaved? Icons.favorite : Icons.favorite_border,color: alreadySaved? Colors.red : Colors.grey),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildList(),
    );
  }
}

class InfinitiList extends StatefulWidget {
  @override
  InfinitiListState createState() => InfinitiListState();
}
