import 'package:flutter_application_1/features/history/domain/usecases/save_translations_usecase.dart';
import 'package:get_it/get_it.dart';

// Tradução
import 'package:flutter_application_1/features/translation/domain/repositories/translate_text_repository.dart';
import 'package:flutter_application_1/features/translation/domain/usecases/translate_text_usecase.dart';
import 'package:flutter_application_1/features/translation/data/repositories/translate_text_repository_impl.dart';

// Histórico
import 'package:flutter_application_1/features/history/domain/repositories/translation_history_repository.dart';
import 'package:flutter_application_1/features/history/domain/usecases/get_translation_history_usecase.dart';
import 'package:flutter_application_1/features/history/data/repositories/translation_history_repository_impl.dart';

// Favorites
import 'package:flutter_application_1/features/favorites/domain/repositories/favorite_repository.dart';
import 'package:flutter_application_1/features/favorites/data/repositories/favorite_repository_impl.dart';
import 'package:flutter_application_1/features/favorites/domain/usecases/save_favorite_usecase.dart';
import 'package:flutter_application_1/features/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:flutter_application_1/features/favorites/domain/usecases/remove_favorite_usecase.dart';

final GetIt injector = GetIt.instance;

void setupInjector() {
  // 📦 Tradução
  injector.registerLazySingleton<TranslateTextRepository>(() => TranslateTextRepositoryImpl());

  injector.registerLazySingleton<TranslateTextUsecase>(() => TranslateTextUsecase(injector()));

  // 📦 Histórico
  injector.registerLazySingleton<TranslationHistoryRepository>(() => TranslationHistoryRepositoryImpl());

  injector.registerLazySingleton<GetTranslationHistoryUsecase>(
    () => GetTranslationHistoryUsecase(injector()),
  );

  injector.registerLazySingleton<SaveTranslationUsecase>(() => SaveTranslationUsecase(injector()));

  // 📦 FAVORITOS
  injector.registerLazySingleton<FavoriteRepository>(() => FavoriteRepositoryImpl());

  injector.registerLazySingleton<GetFavoritesUsecase>(() => GetFavoritesUsecase(injector()));

  injector.registerLazySingleton<SaveFavoriteUsecase>(() => SaveFavoriteUsecase(injector()));

  injector.registerLazySingleton<RemoveFavoriteUsecase>(() => RemoveFavoriteUsecase(injector()));
}
