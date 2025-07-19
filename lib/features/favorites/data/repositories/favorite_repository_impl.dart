import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/features/favorites/domain/entities/favorite_translation_entity.dart';
import 'package:flutter_application_1/features/favorites/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  static const String _storageKey = 'favorite_translations';

  @override
  Future<void> saveFavorite(FavoriteTranslationEntity favorite) async {
    final prefs = await SharedPreferences.getInstance();
    final currentFavorites = await getFavorites();

    // Verifica se já existe (evita duplicados)
    final exists = currentFavorites.any((f) =>
        f.originalText == favorite.originalText &&
        f.translatedText == favorite.translatedText);
    if (exists) return;

    currentFavorites.insert(0, favorite);
    final encoded = currentFavorites.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(_storageKey, encoded);
  }

  @override
  Future<List<FavoriteTranslationEntity>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_storageKey) ?? [];

    return list.map((item) {
      final jsonMap = json.decode(item);
      return FavoriteTranslationEntity.fromJson(jsonMap);
    }).toList();
  }

  @override
  Future<void> removeFavorite(FavoriteTranslationEntity favorite) async {
    final prefs = await SharedPreferences.getInstance();
    final currentFavorites = await getFavorites();

    currentFavorites.removeWhere((f) =>
        f.originalText == favorite.originalText &&
        f.translatedText == favorite.translatedText);

    final encoded = currentFavorites.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(_storageKey, encoded);
  }

  @override
  Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
}
