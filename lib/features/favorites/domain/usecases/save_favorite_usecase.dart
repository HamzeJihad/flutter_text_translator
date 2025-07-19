import '../entities/favorite_translation_entity.dart';
import '../repositories/favorite_repository.dart';

class SaveFavoriteUsecase {
  final FavoriteRepository repository;

  SaveFavoriteUsecase(this.repository);

  Future<void> call(FavoriteTranslationEntity favorite) {
    return repository.saveFavorite(favorite);
  }
}
