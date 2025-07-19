
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

abstract class TranslateTextRepository {

 Future<String> translate(TranslateTextParams params);

 Future<void> downloadModel(TranslateLanguage language);

  Future<bool> isModelDownloaded(TranslateLanguage language);

}

class TranslateTextParams{

  final String text;
  final TranslateLanguage targetLanguage;
  final TranslateLanguage sourceLanguage;

  TranslateTextParams({required this.text, required this.targetLanguage, required this.sourceLanguage});
}