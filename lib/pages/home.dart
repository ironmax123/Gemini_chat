import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../data/list.dart';
import 'components/List_Views/home_view.dart';
import 'components/bottom_sheet.dart';
import 'Lang_list/lang_page.dart';

// ignore: must_be_immutable
class HomePage extends HookWidget {
  HomePage({super.key});

  final List<String> _messages = [];
  final LanguageList languageList = LanguageList();
  String msg = "";
  final controller = TextEditingController();
  final api = dotenv.get('API_KEY');

  void _addMessages(
      String userMsg, String lang, String response, String empty) {
    _messages.insert(0, empty);
    _messages.insert(0, response);
    _messages.insert(0, lang);
    _messages.insert(0, userMsg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Geminiとチャットしよう！"),
        leading: IconButton(
          icon: const Icon(Icons.language),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LangPage()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheetWidget(
                      controller: controller,
                      api: api,
                      languageList: languageList,
                      onMessageSend: _addMessages,
                    );
                  },
                );
              },
              child: const Text('入力'),
            ),
            homelistWidget(_messages, context),
          ],
        ),
      ),
    );
  }
}
