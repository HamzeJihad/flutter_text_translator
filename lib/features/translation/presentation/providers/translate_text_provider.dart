import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/features/translation/domain/entities/translate_text_entity.dart';
import 'package:flutter_application_1/features/translation/domain/usecases/translate_text_usecase.dart';
import 'package:flutter_application_1/features/translation/domain/repositories/translate_text_repository.dart';
import 'package:flutter_application_1/injector/injector.dart';

import 'package:flutter_application_1/features/history/domain/entities/translation_history_entity.dart';
import 'package:flutter_application_1/features/history/presentation/providers/history_provider.dart';


class TranslateTextState {
  final TranslateTextEntity? translateTextEntity;
  final bool? isDownloading;

  TranslateTextState({this.translateTextEntity, this.isDownloading});

  TranslateTextState copyWith({
    TranslateTextEntity? translateTextEntity,
    bool? isDownloading,
  }) {
    return TranslateTextState(
      translateTextEntity: translateTextEntity ?? this.translateTextEntity,
      isDownloading: isDownloading ?? this.isDownloading,
    );
  }
}

class TranslateTextNotifier extends StateNotifier<AsyncValue<TranslateTextState>> {
  TranslateTextNotifier(this._ref) : super(AsyncValue.data(TranslateTextState()));

  final Ref _ref;

  final TranslateTextUsecase _usecase = injector<TranslateTextUsecase>();

  Future<void> translate(TranslateTextParams params) async {
    state = AsyncData(state.value!.copyWith(isDownloading: true));
    try {
      final translatedText = await _usecase(params);

      state = AsyncValue.data(
        state.value!.copyWith(
          translateTextEntity: TranslateTextEntity(translatedText: translatedText),
          isDownloading: false,
        ),
      );

      // Salva no histórico
      final historyEntry = TranslationHistoryEntity(
        originalText: params.text,
        translatedText: translatedText,
        date: DateTime.now(),
      );

      await _ref.read(historyProvider.notifier).addToHistory(historyEntry);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final translateTextProvider =
    StateNotifierProvider<TranslateTextNotifier, AsyncValue<TranslateTextState>>(
  (ref) => TranslateTextNotifier(ref),
);
