import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/value_objects/verse_reference.dart';
import 'reader_state.dart';
import 'reading_mode.dart';

final readerControllerProvider =
    NotifierProvider<ReaderController, ReaderState>(ReaderController.new);

class ReaderController extends Notifier<ReaderState> {
  @override
  ReaderState build() => ReaderState.initial();

  void goToReference(VerseReference reference) {
    state = state.copyWith(
      currentReference: reference,
      lastUpdatedAt: DateTime.now(),
    );
  }

  void nextVerse() {
    final current = state.currentReference;
    goToReference(current.copyWith(verse: current.verse + 1));
  }

  void previousVerse() {
    final current = state.currentReference;
    if (current.verse <= 1) {
      return;
    }
    goToReference(current.copyWith(verse: current.verse - 1));
  }

  void nextChapter() {
    final current = state.currentReference;
    goToReference(current.copyWith(chapter: current.chapter + 1, verse: 1));
  }

  void previousChapter() {
    final current = state.currentReference;
    if (current.chapter <= 1) {
      return;
    }
    goToReference(current.copyWith(chapter: current.chapter - 1, verse: 1));
  }

  void changeReadingMode(ReadingMode mode) {
    state = state.copyWith(readingMode: mode, lastUpdatedAt: DateTime.now());
  }

  void toggleSidebar() {
    state = state.copyWith(
      isSidebarVisible: !state.isSidebarVisible,
      lastUpdatedAt: DateTime.now(),
    );
  }

  void toggleNotesPanel() {
    state = state.copyWith(
      isNotesPanelVisible: !state.isNotesPanelVisible,
      lastUpdatedAt: DateTime.now(),
    );
  }
}
