import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechService {
  static Future<void> speak(String text, {String? language = 'pt-BR'}) async {
    if (text.isEmpty) return;

    FlutterTts tts = FlutterTts();
    await tts.setLanguage(language!);
    await tts.setSpeechRate(0.4);
    await tts.speak(text);
  }
}
