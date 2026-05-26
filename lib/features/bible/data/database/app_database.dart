import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class BibleVersions extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get abbreviation => text()();
  TextColumn get language => text()();
  TextColumn get license => text()();
  TextColumn get source => text().nullable()();
  DateTimeColumn get importedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class BibleBooks extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get sortOrder => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class BibleChapters extends Table {
  TextColumn get versionId => text().references(BibleVersions, #id)();
  TextColumn get bookId => text().references(BibleBooks, #id)();
  IntColumn get chapterNumber => integer()();

  @override
  Set<Column> get primaryKey => {versionId, bookId, chapterNumber};
}

class BibleVerses extends Table {
  TextColumn get versionId => text().references(BibleVersions, #id)();
  TextColumn get bookId => text().references(BibleBooks, #id)();
  IntColumn get chapterNumber => integer()();
  IntColumn get verseNumber => integer()();
  TextColumn get verseText => text().named('text')();
  TextColumn get normalizedText => text()();

  @override
  Set<Column> get primaryKey => {versionId, bookId, chapterNumber, verseNumber};
}

class ReaderPreferences extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get currentBookId => text()();
  IntColumn get currentChapter => integer()();
  IntColumn get currentVerse => integer()();
  TextColumn get primaryTranslationId => text()();
  TextColumn get secondaryTranslationId => text().nullable()();
  TextColumn get readingMode => text()();
  TextColumn get splitMode => text()();
  RealColumn get fontScale => real()();
  BoolColumn get isSidebarVisible => boolean()();
  BoolColumn get isNotesPanelVisible => boolean()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    BibleVersions,
    BibleBooks,
    BibleChapters,
    BibleVerses,
    ReaderPreferences,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationSupportDirectory();
    final file = File(p.join(directory.path, 'biblia_multiplatform.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
