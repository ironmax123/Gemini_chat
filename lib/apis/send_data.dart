import 'dart:math' as math;
import 'package:google_generative_ai/google_generative_ai.dart';

class SendData {
  Future<void> sendingData(api, languageList, controller, onMessageSend) async {
    var random = math.Random();
    final randomNum = random.nextInt(languageList.lang_list.length);
    final model = GenerativeModel(model: 'gemini-pro', apiKey: api);
    final reLang = languageList.lang_list[randomNum];
    final prompt = '${controller.text}の出力結果を$reLangに変換して';
    final response = await model.generateContent([Content.text(prompt)]);
    controller.clear();
    onMessageSend(
      "me:${controller.text}",
      reLang,
      "Gemini:${response.text}",
      "",
    );
  }
}
