class VerseReference {
  const VerseReference({
    required this.bookId,
    required this.bookName,
    required this.chapter,
    required this.verse,
  });

  final String bookId;
  final String bookName;
  final int chapter;
  final int verse;

  String get label => '$bookName $chapter:$verse';

  VerseReference copyWith({
    String? bookId,
    String? bookName,
    int? chapter,
    int? verse,
  }) {
    return VerseReference(
      bookId: bookId ?? this.bookId,
      bookName: bookName ?? this.bookName,
      chapter: chapter ?? this.chapter,
      verse: verse ?? this.verse,
    );
  }
}
