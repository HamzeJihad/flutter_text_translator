import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/features/history/domain/entities/translation_history_entity.dart';
import 'package:flutter_application_1/features/history/domain/repositories/translation_history_repository.dart';

class TranslationHistoryRepositoryImpl implements TranslationHistoryRepository {
  static const String _storageKey = 'translation_history';

  @override
  Future<void> saveTranslation(TranslationHistoryEntity translation) async {
    final prefs = await SharedPreferences.getInstance();

    final history = await getHistory();
    history.insert(0, translation); // adiciona no topo

    final encodedList = history.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(_storageKey, encodedList);
  }

  @override
  Future<List<TranslationHistoryEntity>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_storageKey) ?? [];

    return list.map((e) {
      final decoded = json.decode(e);
      return TranslationHistoryEntity.fromJson(decoded);
    }).toList();
  }

  @override
  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
}
