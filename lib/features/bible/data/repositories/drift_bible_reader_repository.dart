import 'package:drift/drift.dart';

import '../../domain/entities/bible_verse.dart';
import '../../domain/repositories/bible_reader_repository.dart';
import '../../domain/value_objects/verse_reference.dart';
import '../database/app_database.dart' as db;

class DriftBibleReaderRepository implements BibleReaderRepository {
  const DriftBibleReaderRepository(this.database);

  final db.AppDatabase database;

  @override
  Future<BibleVerse?> getVerse({
    required String versionId,
    required VerseReference reference,
  }) async {
    final verse = await _findVerse(
      versionId: versionId,
      bookId: reference.bookId,
      chapter: reference.chapter,
      verse: reference.verse,
    );
    if (verse == null) {
      return null;
    }

    final bookName = await _bookName(reference.bookId);
    return _toDomain(verse, bookName);
  }

  @override
  Future<BibleVerse?> getNextVerse({
    required String versionId,
    required VerseReference reference,
  }) async {
    final sameChapter =
        await (database.select(database.bibleVerses)
              ..where(
                (row) =>
                    row.versionId.equals(versionId) &
                    row.bookId.equals(reference.bookId) &
                    row.chapterNumber.equals(reference.chapter) &
                    row.verseNumber.isBiggerThanValue(reference.verse),
              )
              ..orderBy([(row) => OrderingTerm.asc(row.verseNumber)])
              ..limit(1))
            .getSingleOrNull();

    if (sameChapter != null) {
      final bookName = await _bookName(reference.bookId);
      return _toDomain(sameChapter, bookName);
    }

    final nextChapter = await _findVerse(
      versionId: versionId,
      bookId: reference.bookId,
      chapter: reference.chapter + 1,
      verse: 1,
    );
    if (nextChapter == null) {
      return null;
    }

    final bookName = await _bookName(reference.bookId);
    return _toDomain(nextChapter, bookName);
  }

  @override
  Future<List<BibleVerse>> getChapterVerses({
    required String versionId,
    required String bookId,
    required int chapter,
  }) async {
    final rows =
        await (database.select(database.bibleVerses)
              ..where(
                (row) =>
                    row.versionId.equals(versionId) &
                    row.bookId.equals(bookId) &
                    row.chapterNumber.equals(chapter),
              )
              ..orderBy([(row) => OrderingTerm.asc(row.verseNumber)]))
            .get();

    final bookName = await _bookName(bookId);
    return rows.map((row) => _toDomain(row, bookName)).toList();
  }

  Future<db.BibleVerse?> _findVerse({
    required String versionId,
    required String bookId,
    required int chapter,
    required int verse,
  }) {
    return (database.select(database.bibleVerses)..where(
          (row) =>
              row.versionId.equals(versionId) &
              row.bookId.equals(bookId) &
              row.chapterNumber.equals(chapter) &
              row.verseNumber.equals(verse),
        ))
        .getSingleOrNull();
  }

  Future<String> _bookName(String bookId) async {
    final book = await (database.select(
      database.bibleBooks,
    )..where((row) => row.id.equals(bookId))).getSingleOrNull();
    return book?.name ?? bookId;
  }

  BibleVerse _toDomain(db.BibleVerse row, String bookName) {
    return BibleVerse(
      versionId: row.versionId,
      reference: VerseReference(
        bookId: row.bookId,
        bookName: bookName,
        chapter: row.chapterNumber,
        verse: row.verseNumber,
      ),
      text: row.verseText,
    );
  }
}
