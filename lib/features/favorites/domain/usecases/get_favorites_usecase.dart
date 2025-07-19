import '../entities/favorite_translation_entity.dart';
import '../repositories/favorite_repository.dart';

class GetFavoritesUsecase {
  final FavoriteRepository repository;

  GetFavoritesUsecase(this.repository);

  Future<List<FavoriteTranslationEntity>> call() {
    return repository.getFavorites();
  }
}
