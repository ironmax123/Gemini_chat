import 'package:flutter/material.dart';
import '../data/list.dart';
import 'components/List_Views/lang_view.dart';

class LangPage extends StatelessWidget {
  final LanguageList languageList = LanguageList();

  LangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('変換される言語一覧'),
        ),
        body: langlistWidget(languageList.langlist, context));
  }
}
