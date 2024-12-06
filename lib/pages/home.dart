import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../data/list.dart';
import 'components/List_Views/home_view.dart';
import 'components/bottom_sheet.dart';
import 'Lang_list/lang_page.dart';

class HomePage extends HookWidget {
  HomePage({super.key});

  final LanguageList languageList = LanguageList();
  final controller = TextEditingController();
  final api = dotenv.get('API_KEY');

  @override
  Widget build(BuildContext context) {
    final messages = useState<List<String>>([]);

    void addMessages(
        String userMsg, String lang, String response, String empty) {
      messages.value = [
        empty,
        response,
        lang,
        userMsg,
        ...messages.value,
      ];
    }

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
                      onMessageSend: addMessages,
                    );
                  },
                );
              },
              child: const Text('入力'),
            ),
            homelistWidget(messages.value, context),
          ],
        ),
      ),
    );
  }
}
