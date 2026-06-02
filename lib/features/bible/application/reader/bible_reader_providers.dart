import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/app_database.dart' hide BibleVerse;
import '../../data/database/open_app_database.dart';
import '../../data/repositories/drift_bible_reader_repository.dart';
import '../../domain/entities/bible_verse.dart';
import '../../domain/repositories/bible_reader_repository.dart';
import 'reader_controller.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = openAppDatabase();
  ref.onDispose(database.close);
  return database;
});

final bibleReaderRepositoryProvider = Provider<BibleReaderRepository>((ref) {
  return DriftBibleReaderRepository(ref.watch(appDatabaseProvider));
});

final currentVerseProvider = FutureProvider<BibleVerse?>((ref) {
  final reader = ref.watch(readerControllerProvider);
  final repository = ref.watch(bibleReaderRepositoryProvider);

  return repository.getVerse(
    versionId: reader.primaryTranslationId,
    reference: reader.currentReference,
  );
});

final nextVerseProvider = FutureProvider<BibleVerse?>((ref) {
  final reader = ref.watch(readerControllerProvider);
  final repository = ref.watch(bibleReaderRepositoryProvider);

  return repository.getNextVerse(
    versionId: reader.primaryTranslationId,
    reference: reader.currentReference,
  );
});

final currentChapterVersesProvider = FutureProvider<List<BibleVerse>>((ref) {
  final reader = ref.watch(readerControllerProvider);
  final repository = ref.watch(bibleReaderRepositoryProvider);
  final reference = reader.currentReference;

  return repository.getChapterVerses(
    versionId: reader.primaryTranslationId,
    bookId: reference.bookId,
    chapter: reference.chapter,
  );
});
