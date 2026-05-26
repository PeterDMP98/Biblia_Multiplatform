class BibleImportDocument {
  const BibleImportDocument({required this.version, required this.books});

  final BibleImportVersion version;
  final List<BibleImportBook> books;

  int get verseCount {
    return books.fold<int>(0, (total, book) => total + book.verseCount);
  }

  Map<String, Object?> toJson() {
    return {
      'version': version.toJson(),
      'books': books.map((book) => book.toJson()).toList(),
    };
  }
}

class BibleImportVersion {
  const BibleImportVersion({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.language,
    required this.license,
    this.source,
  });

  final String id;
  final String name;
  final String abbreviation;
  final String language;
  final String license;
  final String? source;

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'abbreviation': abbreviation,
      'language': language,
      'license': license,
      'source': source,
    };
  }
}

class BibleImportBook {
  const BibleImportBook({
    required this.id,
    required this.name,
    required this.order,
    required this.chapters,
  });

  final String id;
  final String name;
  final int order;
  final List<BibleImportChapter> chapters;

  int get verseCount {
    return chapters.fold<int>(
      0,
      (total, chapter) => total + chapter.verses.length,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'order': order,
      'chapters': chapters.map((chapter) => chapter.toJson()).toList(),
    };
  }
}

class BibleImportChapter {
  const BibleImportChapter({required this.number, required this.verses});

  final int number;
  final List<BibleImportVerse> verses;

  Map<String, Object?> toJson() {
    return {
      'number': number,
      'verses': verses.map((verse) => verse.toJson()).toList(),
    };
  }
}

class BibleImportVerse {
  const BibleImportVerse({required this.number, required this.text});

  final int number;
  final String text;

  Map<String, Object?> toJson() {
    return {'number': number, 'text': text};
  }
}
