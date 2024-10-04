import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:math' as math;

import 'lang_page.dart';
import 'list.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemini_Chat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Geminiと会話しよう!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _messages = [];
  final LanguageList languageList = LanguageList();
  String msg = "";
  final controller = TextEditingController();
  final api = "APIkey";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
                    return Container(
                      height: 250 + MediaQuery.of(context).viewInsets.bottom,
                      color: Colors.blue[200],
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                decoration: const InputDecoration(
                                  hintText: 'プロンプトを入力',
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    msg = text;
                                  });
                                },
                                controller: controller,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  controller.clear();
                                  var random = math.Random();
                                  final randomNum = random
                                      .nextInt(languageList.lang_list.length);
                                  final model = GenerativeModel(
                                      model: 'gemini-pro', apiKey: api);
                                  final re_lang =
                                      languageList.lang_list[randomNum];
                                  final prompt = '$msgの出力結果を${re_lang}に変換して';
                                  final response = await model
                                      .generateContent([Content.text(prompt)]);
                                  setState(() {
                                    _messages.insert(0, "");
                                    _messages.insert(
                                        0, "Gemini:${response.text}");
                                    _messages.insert(0, re_lang);
                                    _messages.insert(0, "me:$msg");
                                  });
                                }, //_sendMessage,
                                child: const Text('送信'),
                              ),
                            ]),
                      ),
                    );
                  },
                );
              },
              child: const Text('入力'),
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                      _messages[index],
                      style: const TextStyle(fontSize: 20.0),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
