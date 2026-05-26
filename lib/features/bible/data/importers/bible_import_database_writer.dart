import 'package:drift/drift.dart';

import '../database/app_database.dart';
import 'bible_import_document.dart';

class BibleImportDatabaseWriter {
  const BibleImportDatabaseWriter(this.database);

  final AppDatabase database;

  Future<void> write(BibleImportDocument document) async {
    await database.transaction(() async {
      await database
          .into(database.bibleVersions)
          .insertOnConflictUpdate(
            BibleVersionsCompanion.insert(
              id: document.version.id,
              name: document.version.name,
              abbreviation: document.version.abbreviation,
              language: document.version.language,
              license: document.version.license,
              source: Value(document.version.source),
              importedAt: DateTime.now(),
            ),
          );

      for (final book in document.books) {
        await database
            .into(database.bibleBooks)
            .insert(
              BibleBooksCompanion.insert(
                id: book.id,
                name: book.name,
                sortOrder: book.order,
              ),
              mode: InsertMode.insertOrIgnore,
            );

        for (final chapter in book.chapters) {
          await database
              .into(database.bibleChapters)
              .insert(
                BibleChaptersCompanion.insert(
                  versionId: document.version.id,
                  bookId: book.id,
                  chapterNumber: chapter.number,
                ),
                mode: InsertMode.insertOrReplace,
              );

          for (final verse in chapter.verses) {
            await database
                .into(database.bibleVerses)
                .insert(
                  BibleVersesCompanion.insert(
                    versionId: document.version.id,
                    bookId: book.id,
                    chapterNumber: chapter.number,
                    verseNumber: verse.number,
                    verseText: verse.text,
                    normalizedText: _normalizeForSearch(verse.text),
                  ),
                  mode: InsertMode.insertOrReplace,
                );
          }
        }
      }
    });
  }

  String _normalizeForSearch(String text) {
    return text.toLowerCase().replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}
