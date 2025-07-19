import 'package:flutter_application_1/features/translation/domain/repositories/translate_text_repository.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class TranslateTextRepositoryImpl implements TranslateTextRepository {
  final _onModelManager = OnDeviceTranslatorModelManager();

  @override
  Future<String> translate(TranslateTextParams params) async {
    final onDeviceTranslator = OnDeviceTranslator(
      sourceLanguage: params.sourceLanguage,
      targetLanguage: params.targetLanguage,
    );

    return await onDeviceTranslator.translateText(params.text);
  }

  @override
  Future<void> downloadModel(TranslateLanguage language) async {
    await _onModelManager.downloadModel(language.bcpCode);
  }

  @override
  Future<bool> isModelDownloaded(TranslateLanguage language) async {
    return await _onModelManager
        .isModelDownloaded(language.bcpCode)
        .then((value) {
          return value;
        })
        .catchError((error) {
          return false;
        });
  }
}
