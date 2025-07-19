class TranslationHistoryEntity {
  final String originalText;
  final String translatedText;
  final DateTime date;

  TranslationHistoryEntity({
    required this.originalText,
    required this.translatedText,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'originalText': originalText,
        'translatedText': translatedText,
        'date': date.toIso8601String(),
      };

  factory TranslationHistoryEntity.fromJson(Map<String, dynamic> json) {
    return TranslationHistoryEntity(
      originalText: json['originalText'],
      translatedText: json['translatedText'],
      date: DateTime.parse(json['date']),
    );
  }
}
