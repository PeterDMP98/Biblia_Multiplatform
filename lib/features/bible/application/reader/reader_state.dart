import '../../domain/value_objects/verse_reference.dart';
import 'reading_mode.dart';

class ReaderState {
  const ReaderState({
    required this.currentReference,
    required this.primaryTranslationId,
    required this.readingMode,
    required this.splitMode,
    required this.fontScale,
    required this.isSidebarVisible,
    required this.isNotesPanelVisible,
    required this.lastUpdatedAt,
    this.secondaryTranslationId,
  });

  factory ReaderState.initial() {
    return ReaderState(
      currentReference: const VerseReference(
        bookId: 'JHN',
        bookName: 'Juan',
        chapter: 3,
        verse: 16,
      ),
      primaryTranslationId: 'rv1909',
      secondaryTranslationId: 'web',
      readingMode: ReadingMode.focusedVerseSpread,
      splitMode: SplitMode.nextVerse,
      fontScale: 1,
      isSidebarVisible: true,
      isNotesPanelVisible: false,
      lastUpdatedAt: DateTime.now(),
    );
  }

  final VerseReference currentReference;
  final String primaryTranslationId;
  final String? secondaryTranslationId;
  final ReadingMode readingMode;
  final SplitMode splitMode;
  final double fontScale;
  final bool isSidebarVisible;
  final bool isNotesPanelVisible;
  final DateTime lastUpdatedAt;

  ReaderState copyWith({
    VerseReference? currentReference,
    String? primaryTranslationId,
    String? secondaryTranslationId,
    ReadingMode? readingMode,
    SplitMode? splitMode,
    double? fontScale,
    bool? isSidebarVisible,
    bool? isNotesPanelVisible,
    DateTime? lastUpdatedAt,
  }) {
    return ReaderState(
      currentReference: currentReference ?? this.currentReference,
      primaryTranslationId: primaryTranslationId ?? this.primaryTranslationId,
      secondaryTranslationId:
          secondaryTranslationId ?? this.secondaryTranslationId,
      readingMode: readingMode ?? this.readingMode,
      splitMode: splitMode ?? this.splitMode,
      fontScale: fontScale ?? this.fontScale,
      isSidebarVisible: isSidebarVisible ?? this.isSidebarVisible,
      isNotesPanelVisible: isNotesPanelVisible ?? this.isNotesPanelVisible,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
    );
  }
}
