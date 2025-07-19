import 'package:flutter_application_1/features/history/domain/usecases/save_translations_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/features/history/domain/entities/translation_history_entity.dart';
import 'package:flutter_application_1/features/history/presentation/providers/history_provider.dart';
import 'package:flutter_application_1/features/history/domain/usecases/get_translation_history_usecase.dart';
import 'package:flutter_application_1/injector/injector.dart';
import 'package:mockito/mockito.dart';

import '../mocks/mocks.mocks.dart';

void main() {
  group('HistoryProvider Tests', () {
    late MockGetTranslationHistoryUsecase mockGetHistoryUsecase;
    late MockSaveTranslationUsecase mockSaveUsecase;
    late MockTranslationHistoryRepository mockRepository;
    late ProviderContainer container;

    final entity = TranslationHistoryEntity(
      originalText: 'Hello',
      translatedText: 'Olá',
      date: DateTime.now(),
    );

    setUp(() {
      mockGetHistoryUsecase = MockGetTranslationHistoryUsecase();
      mockSaveUsecase = MockSaveTranslationUsecase();
      mockRepository = MockTranslationHistoryRepository();

      injector.reset();
      injector.registerLazySingleton<GetTranslationHistoryUsecase>(() => mockGetHistoryUsecase);
      injector.registerLazySingleton<SaveTranslationUsecase>(() => mockSaveUsecase);

      // STUB DO GETTER repository
      when(mockGetHistoryUsecase.repository).thenReturn(mockRepository);
      when(mockRepository.clearHistory()).thenAnswer((_) async {});

      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial history should be empty', () async {
      when(mockGetHistoryUsecase()).thenAnswer((_) async => []);

      await container.read(historyProvider.notifier).loadHistory();
      final state = container.read(historyProvider);

      expect(state, isA<AsyncData<List<TranslationHistoryEntity>>>());
      expect(state.value, isEmpty);
    });

    test('Add translation to history', () async {
      when(mockGetHistoryUsecase()).thenAnswer((_) async => []);
      when(mockSaveUsecase(entity)).thenAnswer((_) async {});

      final notifier = container.read(historyProvider.notifier);

      when(mockGetHistoryUsecase()).thenAnswer((_) async => [entity]);

      await notifier.addToHistory(entity);

      final updated = container.read(historyProvider);
      expect(updated, isA<AsyncData<List<TranslationHistoryEntity>>>());
      expect(updated.value, contains(entity));
    });

    test('Clear history', () async {
      when(mockGetHistoryUsecase()).thenAnswer((_) async => [entity]);
      when(mockSaveUsecase(entity)).thenAnswer((_) async {});
      when(mockGetHistoryUsecase.repository).thenReturn(mockRepository);
      when(mockRepository.clearHistory()).thenAnswer((_) async {});

      final notifier = container.read(historyProvider.notifier);
      await notifier.addToHistory(entity);

      injector.registerLazySingleton<GetTranslationHistoryUsecase>(() => mockGetHistoryUsecase);

      when(mockGetHistoryUsecase()).thenAnswer((_) async => []);
      await notifier.clearHistory();

      final cleared = container.read(historyProvider);
      expect(cleared, isA<AsyncData<List<TranslationHistoryEntity>>>());
      expect(cleared.value, isEmpty);
    });
  });
}
