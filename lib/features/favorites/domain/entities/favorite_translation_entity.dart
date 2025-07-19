class FavoriteTranslationEntity {
  final String originalText;
  final String translatedText;

  FavoriteTranslationEntity({
    required this.originalText,
    required this.translatedText,
  });

  Map<String, dynamic> toJson() => {
        'originalText': originalText,
        'translatedText': translatedText,
      };

  factory FavoriteTranslationEntity.fromJson(Map<String, dynamic> json) {
    return FavoriteTranslationEntity(
      originalText: json['originalText'],
      translatedText: json['translatedText'],
    );
  }
}
