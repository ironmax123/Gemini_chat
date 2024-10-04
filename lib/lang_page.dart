import 'main.dart';
import 'package:flutter/material.dart';
import 'list.dart';

class LangPage extends StatelessWidget {
  final LanguageList languageList = LanguageList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('変換される言語一覧'),
      ),
      body: Expanded(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView.builder(
            itemCount: languageList.lang_list.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                languageList.lang_list[index],
                style: const TextStyle(fontSize: 20.0),
              );
            },
          ),
        ),
      ),
    );
  }
}
