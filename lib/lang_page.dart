import 'main.dart';
import 'package:flutter/material.dart';

class LangPage extends StatelessWidget {

  final List<String> lang_list=["タイ語","フィンランド後","ギリシャ語","ロシア語"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('変換される言語一覧'),
      ),

      body:
      Expanded(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView.builder(
            itemCount: lang_list.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                lang_list[index],
                style: const TextStyle(fontSize: 20.0),
              );
            },
          ),
        ),
      ),
    );
  }
}