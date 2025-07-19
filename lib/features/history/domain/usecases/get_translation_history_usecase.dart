import '../entities/translation_history_entity.dart';
import '../repositories/translation_history_repository.dart';

class GetTranslationHistoryUsecase {
  final TranslationHistoryRepository repository;

  GetTranslationHistoryUsecase(this.repository);

  Future<List<TranslationHistoryEntity>> call() {
    return repository.getHistory();
  }
}
