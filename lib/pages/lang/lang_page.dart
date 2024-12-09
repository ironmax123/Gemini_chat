import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gemini_chat/pages/components/List_Views/view.dart';
import 'data/list.dart';

@RoutePage()
class LangPage extends StatelessWidget {
  LangPage({super.key});
  final LanguageList languageList = LanguageList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('変換される言語一覧'),
        ),
        body: listWidget(languageList.langlist, context, useExpanded: false));
  }
}
