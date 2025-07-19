import 'package:flutter_application_1/features/history/domain/usecases/get_translation_history_usecase.dart';
import 'package:flutter_application_1/features/history/domain/usecases/save_translations_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_application_1/features/translation/domain/domain.dart';
import 'package:flutter_application_1/features/translation/presentation/providers/translate_text_provider.dart';
import 'package:flutter_application_1/injector/injector.dart';
import '../mocks/mocks.mocks.dart';

void main() {
  late MockTranslateTextUsecase mockUsecase;
  late MockGetTranslationHistoryUsecase mockGetHistoryUsecase;
  late MockSaveTranslationUsecase mockSaveUsecase;


 setUp(() {
  mockUsecase = MockTranslateTextUsecase();
  mockGetHistoryUsecase = MockGetTranslationHistoryUsecase();
  mockSaveUsecase = MockSaveTranslationUsecase();

  injector.reset();
  injector.registerLazySingleton<TranslateTextUsecase>(() => mockUsecase);
  injector.registerLazySingleton<GetTranslationHistoryUsecase>(() => mockGetHistoryUsecase);
  injector.registerLazySingleton<SaveTranslationUsecase>(() => mockSaveUsecase); 
});


  test('Deve atualizar o estado com texto traduzido', () async {
    final container = ProviderContainer();

    final params = TranslateTextParams(
      text: 'Olá',
      sourceLanguage: TranslateLanguage.portuguese,
      targetLanguage: TranslateLanguage.english,
    );

    when(mockUsecase(params)).thenAnswer((_) async => 'Hello');

    final notifier = container.read(translateTextProvider.notifier);
    await notifier.translate(params);

    final state = container.read(translateTextProvider);

    expect(state.value?.translateTextEntity?.translatedText, 'Hello');
    expect(state.value?.isDownloading, false);
  });

  test('Deve tratar erro ao traduzir', () async {
    final container = ProviderContainer();

    final params = TranslateTextParams(
      text: 'Erro',
      sourceLanguage: TranslateLanguage.portuguese,
      targetLanguage: TranslateLanguage.english,
    );

    when(mockUsecase(params)).thenThrow(Exception('Erro na tradução'));

    final notifier = container.read(translateTextProvider.notifier);
    await notifier.translate(params);

    final state = container.read(translateTextProvider);

    expect(state.hasError, true);
    expect(state.error.toString(), contains('Erro na tradução'));
  });
}
