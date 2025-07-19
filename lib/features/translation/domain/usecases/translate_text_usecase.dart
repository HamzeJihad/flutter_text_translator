import 'package:flutter_application_1/features/translation/domain/repositories/translate_text_repository.dart';

class TranslateTextUsecase {
  final TranslateTextRepository translateTextRepository;

  TranslateTextUsecase(this.translateTextRepository);

  Future<String> call(TranslateTextParams params) async {
    if (!await translateTextRepository.isModelDownloaded(params.sourceLanguage)) {
      await translateTextRepository.downloadModel(params.sourceLanguage);
    }

    if (!await translateTextRepository.isModelDownloaded(params.targetLanguage)) {
      await translateTextRepository.downloadModel(params.targetLanguage);
    }
    return await translateTextRepository.translate(params);
  }
}
