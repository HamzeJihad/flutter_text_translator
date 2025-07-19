import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

final sourceLanguageProvider = StateProvider<TranslateLanguage>(
  (ref) => TranslateLanguage.portuguese,
);

final targetLanguageProvider = StateProvider<TranslateLanguage>(
  (ref) => TranslateLanguage.english,
);