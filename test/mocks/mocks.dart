import 'package:flutter_application_1/features/history/domain/repositories/translation_history_repository.dart';
import 'package:flutter_application_1/features/history/domain/usecases/get_translation_history_usecase.dart';
import 'package:flutter_application_1/features/history/domain/usecases/save_translations_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_application_1/features/translation/domain/usecases/translate_text_usecase.dart';

@GenerateMocks([
  TranslateTextUsecase,
  GetTranslationHistoryUsecase,
  SaveTranslationUsecase,
  TranslationHistoryRepository
])
void main() {}
