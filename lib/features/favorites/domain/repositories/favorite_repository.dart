import '../entities/favorite_translation_entity.dart';

abstract class FavoriteRepository {
  Future<void> saveFavorite(FavoriteTranslationEntity favorite);
  Future<List<FavoriteTranslationEntity>> getFavorites();
  Future<void> removeFavorite(FavoriteTranslationEntity favorite);
  Future<void> clearFavorites();
}
