import '../entities/favorite_translation_entity.dart';
import '../repositories/favorite_repository.dart';

class RemoveFavoriteUsecase {
  final FavoriteRepository repository;

  RemoveFavoriteUsecase(this.repository);

  Future<void> call(FavoriteTranslationEntity favorite) {
    return repository.removeFavorite(favorite);
  }
}
