import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class LanguageToCodeMapper {
  static String mapLanguage(TranslateLanguage language) {
    switch (language) {
      case TranslateLanguage.portuguese:
        return 'pt-BR';
      case TranslateLanguage.english:
        return 'en-US';
      case TranslateLanguage.spanish:
        return 'es-ES';
      case TranslateLanguage.french:
        return 'fr-FR';
      case TranslateLanguage.german:
        return 'de-DE';
      case TranslateLanguage.italian:
        return 'it-IT';
      case TranslateLanguage.japanese:
        return 'ja-JP';
      case TranslateLanguage.korean:
        return 'ko-KR';
      case TranslateLanguage.chinese:
        return 'zh-CN';
      case TranslateLanguage.arabic:
        return 'ar-SA';
      case TranslateLanguage.russian:
        return 'ru-RU';
      case TranslateLanguage.hindi:
        return 'hi-IN';
      case TranslateLanguage.dutch:
        return 'nl-NL';
      case TranslateLanguage.turkish:
        return 'tr-TR';
      case TranslateLanguage.persian:
        return 'fa-IR';
      case TranslateLanguage.indonesian:
        return 'id-ID';
      case TranslateLanguage.thai:
        return 'th-TH';
      case TranslateLanguage.vietnamese:
        return 'vi-VN';
      case TranslateLanguage.swedish:
        return 'sv-SE';
      case TranslateLanguage.norwegian:
        return 'no-NO';
      case TranslateLanguage.danish:
        return 'da-DK';
      case TranslateLanguage.finnish:
        return 'fi-FI';
      case TranslateLanguage.polish:
        return 'pl-PL';

      default:
        return 'en-US';
    }
  }
}
