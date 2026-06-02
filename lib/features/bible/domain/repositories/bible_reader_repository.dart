import '../entities/bible_verse.dart';
import '../value_objects/verse_reference.dart';

abstract class BibleReaderRepository {
  Future<BibleVerse?> getVerse({
    required String versionId,
    required VerseReference reference,
  });

  Future<BibleVerse?> getNextVerse({
    required String versionId,
    required VerseReference reference,
  });

  Future<List<BibleVerse>> getChapterVerses({
    required String versionId,
    required String bookId,
    required int chapter,
  });
}
