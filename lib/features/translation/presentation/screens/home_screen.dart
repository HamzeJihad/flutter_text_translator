import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/translation/domain/helpers/language_to_code_mapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/features/translation/domain/domain.dart';
import 'package:flutter_application_1/features/translation/presentation/providers/providers.dart';
import 'package:flutter_application_1/features/favorites/domain/entities/favorite_translation_entity.dart';
import 'package:flutter_application_1/features/favorites/presentation/providers/favorites_provider.dart';

import 'package:google_mlkit_translation/google_mlkit_translation.dart';

import '../components/components.dart';
import '../providers/services/services.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  static final language = TranslateLanguage.values;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final translateTextProviderAsync = ref.watch(translateTextProvider);
    final sourceLanguage = ref.watch(sourceLanguageProvider);
    final targetLanguage = ref.watch(targetLanguageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tradutor'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              context.push('/favorites'); 
            },
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              context.push('/history'); 
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                TranslateOptions(language),
                const SizedBox(height: 16),

                TranslateBox(
                  controller: controller,
                  isTextField: true,
                  labelText: 'Escreva algo',
                  onSubmitted: (value) {
                    ref
                        .read(translateTextProvider.notifier)
                        .translate(
                          TranslateTextParams(
                            text: value,
                            sourceLanguage: sourceLanguage,
                            targetLanguage: targetLanguage,
                          ),
                        );
                  },
                  icons: [
                    IconButton(
                      icon: const Icon(Icons.volume_up, size: 20),
                      onPressed: () {
                        TextToSpeechService.speak(
                          controller.text,
                          language: LanguageToCodeMapper.mapLanguage(sourceLanguage),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy, size: 20),
                      onPressed: () {
                        ClipboardService.copyToClipboard(controller.text);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, size: 20),
                      onPressed: () {
                        ref.invalidate(translateTextProvider);
                        controller.clear();
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Exibição da tradução
                translateTextProviderAsync.whenOrNull(
                  data: (data) => Column(
                    children: [
                      TranslateBox(
                        translatedText: data.translateTextEntity?.translatedText,
                        isTextField: false,
                        labelText: 'Texto traduzido',
                        icons: [
                          IconButton(
                            icon: const Icon(Icons.volume_up, size: 20),
                            onPressed: () {
                              TextToSpeechService.speak(
                                data.translateTextEntity?.translatedText ?? '',
                                language: LanguageToCodeMapper.mapLanguage(targetLanguage),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.copy, size: 20),
                            onPressed: () {
                              ClipboardService.copyToClipboard(
                                data.translateTextEntity?.translatedText ?? '',
                              );
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Visibility(
                        visible:
                            data.translateTextEntity?.translatedText != null &&
                            data.translateTextEntity!.translatedText != '',
                        child: FilledButton.icon(
                          icon: const Icon(Icons.favorite_border),
                          label: const Text('Salvar nos Favoritos'),
                          onPressed: () {
                            if (data.translateTextEntity?.translatedText?.isNotEmpty ?? false) {
                              ref
                                  .read(favoritesProvider.notifier)
                                  .addFavorite(
                                    FavoriteTranslationEntity(
                                      originalText: controller.text,
                                      translatedText: data.translateTextEntity!.translatedText!,
                                    ),
                                  );
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(const SnackBar(content: Text('Adicionado aos favoritos')));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )!,

                const SizedBox(height: 16),

                FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    minimumSize: WidgetStateProperty.all(const Size(126, 44)),
                    maximumSize: WidgetStateProperty.all(const Size(126, 44)),
                  ),
                  onPressed: () {
                    ref
                        .read(translateTextProvider.notifier)
                        .translate(
                          TranslateTextParams(
                            text: controller.text,
                            sourceLanguage: sourceLanguage,
                            targetLanguage: targetLanguage,
                          ),
                        );
                  },
                  child: (translateTextProviderAsync.value?.isDownloading ?? false)
                      ? const Center(child: CircularProgressIndicator.adaptive(backgroundColor: Colors.white))
                      : const Text('Traduzir'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
