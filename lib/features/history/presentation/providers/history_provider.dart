import 'package:flutter_application_1/features/history/domain/usecases/save_translations_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/features/history/domain/entities/translation_history_entity.dart';
import 'package:flutter_application_1/features/history/domain/usecases/get_translation_history_usecase.dart';
import 'package:flutter_application_1/injector/injector.dart';

class HistoryNotifier extends StateNotifier<AsyncValue<List<TranslationHistoryEntity>>> {
  HistoryNotifier(this._getUsecase, this._saveUsecase)
      : super(const AsyncValue.loading()) {
    loadHistory();
  }

  final GetTranslationHistoryUsecase _getUsecase;
  final SaveTranslationUsecase _saveUsecase;

  Future<void> loadHistory() async {
    try {
      final history = await _getUsecase();
      state = AsyncValue.data(history);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addToHistory(TranslationHistoryEntity translation) async {
    await _saveUsecase(translation);
    await loadHistory(); // recarrega com novo item no topo
  }

  Future<void> clearHistory() async {
    final list = state.value ?? [];
    if (list.isEmpty) return;

    // apenas remove do SharedPreferences
    await injector.get<GetTranslationHistoryUsecase>()
        .repository
        .clearHistory();

    state = const AsyncValue.data([]);
  }
}

final historyProvider = StateNotifierProvider<HistoryNotifier, AsyncValue<List<TranslationHistoryEntity>>>(
  (ref) => HistoryNotifier(
    injector.get<GetTranslationHistoryUsecase>(),
    injector.get<SaveTranslationUsecase>(),
  ),
);
