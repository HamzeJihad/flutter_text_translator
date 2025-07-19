import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/translation/presentation/components/custom_drop_down_menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

import '../providers/providers.dart';

class TranslateOptions extends ConsumerWidget {
  const TranslateOptions(this.language, {super.key});

  final List<TranslateLanguage> language;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sourceLanguage = ref.watch(sourceLanguageProvider);
    final targetLanguage = ref.watch(targetLanguageProvider);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: ColoredBox(
        color: Colors.blue,
        child: Row(
          children: [
            CustomDropDownMenu(
              initialSelection: sourceLanguage,
              dropdownMenuEntries: language,
              onSelected: (value) {
                ref.read(sourceLanguageProvider.notifier).state = value;
              },
            ),

            Icon(Icons.arrow_forward, color: Colors.white),
            CustomDropDownMenu(
              initialSelection: targetLanguage,
              dropdownMenuEntries: language,

              onSelected: (value) {
                ref.read(targetLanguageProvider.notifier).state = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
