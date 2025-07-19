import '../entities/translation_history_entity.dart';

abstract class TranslationHistoryRepository {
  Future<void> saveTranslation(TranslationHistoryEntity translation);
  Future<List<TranslationHistoryEntity>> getHistory();
  Future<void> clearHistory();
}
