import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/features/favorites/domain/entities/favorite_translation_entity.dart';
import 'package:flutter_application_1/features/favorites/domain/usecases/save_favorite_usecase.dart';
import 'package:flutter_application_1/features/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:flutter_application_1/features/favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:flutter_application_1/injector/injector.dart';

class FavoritesNotifier extends StateNotifier<AsyncValue<List<FavoriteTranslationEntity>>> {
  FavoritesNotifier(this._getUsecase, this._saveUsecase, this._removeUsecase)
      : super(const AsyncValue.loading()) {
    loadFavorites();
  }

  final GetFavoritesUsecase _getUsecase;
  final SaveFavoriteUsecase _saveUsecase;
  final RemoveFavoriteUsecase _removeUsecase;

  Future<void> loadFavorites() async {
    try {
      final favorites = await _getUsecase();
      state = AsyncValue.data(favorites);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addFavorite(FavoriteTranslationEntity favorite) async {
    await _saveUsecase(favorite);
    await loadFavorites();
  }

  Future<void> removeFavorite(FavoriteTranslationEntity favorite) async {
    await _removeUsecase(favorite);
    await loadFavorites();
  }

  void clear() {
    state = const AsyncValue.data([]);
  }
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, AsyncValue<List<FavoriteTranslationEntity>>>(
  (ref) => FavoritesNotifier(
    injector.get<GetFavoritesUsecase>(),
    injector.get<SaveFavoriteUsecase>(),
    injector.get<RemoveFavoriteUsecase>(),
  ),
);
