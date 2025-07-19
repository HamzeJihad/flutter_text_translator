import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/features/favorites/domain/entities/favorite_translation_entity.dart';
import 'package:flutter_application_1/features/favorites/presentation/providers/favorites_provider.dart';

class FavoriteCard extends ConsumerWidget {
  final FavoriteTranslationEntity favorite;

  const FavoriteCard({super.key, required this.favorite});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ListTile(
        title: Text(favorite.originalText),
        subtitle: Text('➡ ${favorite.translatedText}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            ref.read(favoritesProvider.notifier).removeFavorite(favorite);
          },
        ),
      ),
    );
  }
}
