import 'dart:math' as math;
import 'package:google_generative_ai/google_generative_ai.dart';

class SendData {
  Future<void> sendingData(api, languageList, controller, onMessageSend) async {
    var random = math.Random();
    final randomNum = random.nextInt(languageList.langlist.length);
    final model = GenerativeModel(model: 'gemini-2.0-flash', apiKey: api);
    final reLang = languageList.langlist[randomNum];
    final prompt = '${controller.text}の出力結果を$reLangに変換して教えて';
    final response = await model.generateContent([Content.text(prompt)]);
    onMessageSend(
      "Gemini:${response.text}",
      reLang,
      "me:${controller.text}",
      "",
    );
    controller.clear();
  }
}
