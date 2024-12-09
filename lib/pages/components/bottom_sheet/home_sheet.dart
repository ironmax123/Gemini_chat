// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gemini_chat/apis/send_data.dart';
import 'package:go_router/go_router.dart';

import '../../lang/data/list.dart';

// ignore: must_be_immutable
class BottomSheetWidget extends StatelessWidget {
  final TextEditingController controller;
  final String api;
  final LanguageList languageList;
  final Function(String, String, String, String) onMessageSend;

  BottomSheetWidget({
    super.key,
    required this.controller,
    required this.api,
    required this.languageList,
    required this.onMessageSend,
  });

  SendData sending = SendData();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250 + MediaQuery.of(context).viewInsets.bottom,
      color: Colors.blue[200],
      child: Center(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'プロンプトを入力',
              ),
              controller: controller,
            ),
            ElevatedButton(
              onPressed: () async {
                controller.text.isNotEmpty
                    ? await sending.sendingData(
                        api, languageList, controller, onMessageSend)
                    : ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('プロンプトが空白です')),
                      );
                context.pop();
              },
              child: const Text('送信'),
            ),
          ],
        ),
      ),
    );
  }
}
