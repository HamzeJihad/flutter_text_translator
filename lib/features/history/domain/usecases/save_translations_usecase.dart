import '../entities/translation_history_entity.dart';
import '../repositories/translation_history_repository.dart';

class SaveTranslationUsecase {
  final TranslationHistoryRepository repository;

  SaveTranslationUsecase(this.repository);

  Future<void> call(TranslationHistoryEntity translation) {
    return repository.saveTranslation(translation);
  }
}
