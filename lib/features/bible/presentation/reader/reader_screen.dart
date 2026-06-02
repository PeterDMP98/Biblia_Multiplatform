import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/reader/bible_reader_providers.dart';
import '../../application/reader/reader_controller.dart';
import '../../application/reader/reading_mode.dart';
import '../../domain/entities/bible_verse.dart';

class ReaderScreen extends ConsumerWidget {
  const ReaderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reader = ref.watch(readerControllerProvider);
    final controller = ref.read(readerControllerProvider.notifier);
    final currentVerse = ref.watch(currentVerseProvider);
    final nextVerse = ref.watch(nextVerseProvider);
    final chapterVerses = ref.watch(currentChapterVersesProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (reader.isSidebarVisible) const _ReaderSidebar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _ReaderToolbar(
                      reference: reader.currentReference.label,
                      mode: reader.readingMode,
                      onPrevious: controller.previousVerse,
                      onNext: controller.nextVerse,
                      onToggleSidebar: controller.toggleSidebar,
                      onChangeMode: controller.changeReadingMode,
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: switch (reader.readingMode) {
                        ReadingMode.chapter => _ChapterReader(
                          verses: chapterVerses,
                          fontScale: reader.fontScale,
                        ),
                        ReadingMode.focusedVerseSpread => _VerseSpread(
                          currentVerse: currentVerse,
                          nextVerse: nextVerse,
                          fontScale: reader.fontScale,
                        ),
                        ReadingMode.splitPanel => _SplitPanel(
                          currentVerse: currentVerse,
                          nextVerse: nextVerse,
                          fontScale: reader.fontScale,
                        ),
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Fuente: RV1909 - lectura local offline',
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReaderSidebar extends StatelessWidget {
  const _ReaderSidebar();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: 88,
      color: colors.surface,
      child: Column(
        children: [
          const SizedBox(height: 24),
          Icon(Icons.menu_book_rounded, color: colors.primary),
          const Spacer(),
          IconButton(
            tooltip: 'Buscar',
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(
            tooltip: 'Notas',
            onPressed: () {},
            icon: const Icon(Icons.edit_note_rounded),
          ),
          IconButton(
            tooltip: 'Presentacion',
            onPressed: () {},
            icon: const Icon(Icons.live_tv_rounded),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _ReaderToolbar extends StatelessWidget {
  const _ReaderToolbar({
    required this.reference,
    required this.mode,
    required this.onPrevious,
    required this.onNext,
    required this.onToggleSidebar,
    required this.onChangeMode,
  });

  final String reference;
  final ReadingMode mode;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onToggleSidebar;
  final ValueChanged<ReadingMode> onChangeMode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        IconButton(
          tooltip: 'Menu',
          onPressed: onToggleSidebar,
          icon: const Icon(Icons.menu_rounded),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(reference, style: theme.textTheme.headlineMedium)),
        SegmentedButton<ReadingMode>(
          segments: const [
            ButtonSegment(
              value: ReadingMode.chapter,
              icon: Icon(Icons.subject_rounded),
            ),
            ButtonSegment(
              value: ReadingMode.focusedVerseSpread,
              icon: Icon(Icons.menu_book_rounded),
            ),
            ButtonSegment(
              value: ReadingMode.splitPanel,
              icon: Icon(Icons.view_column_rounded),
            ),
          ],
          selected: {mode},
          showSelectedIcon: false,
          onSelectionChanged: (selection) => onChangeMode(selection.first),
        ),
        const SizedBox(width: 12),
        IconButton(
          tooltip: 'Anterior',
          onPressed: onPrevious,
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        IconButton(
          tooltip: 'Siguiente',
          onPressed: onNext,
          icon: const Icon(Icons.chevron_right_rounded),
        ),
      ],
    );
  }
}

class _VerseSpread extends StatelessWidget {
  const _VerseSpread({
    required this.currentVerse,
    required this.nextVerse,
    required this.fontScale,
  });

  final AsyncValue<BibleVerse?> currentVerse;
  final AsyncValue<BibleVerse?> nextVerse;
  final double fontScale;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final pages = [
          _VersePage(
            reference: _verseReference(currentVerse, 'Versiculo actual'),
            text: _verseText(currentVerse),
            fontScale: fontScale,
          ),
          _VersePage(
            reference: _verseReference(nextVerse, 'Versiculo siguiente'),
            text: _verseText(nextVerse),
            fontScale: fontScale,
          ),
        ];

        if (constraints.maxWidth < 820) {
          return ListView.separated(
            itemCount: pages.length,
            separatorBuilder: (_, _) => const SizedBox(height: 16),
            itemBuilder: (_, index) =>
                SizedBox(height: 320, child: pages[index]),
          );
        }

        return Row(
          children: [
            Expanded(child: pages.first),
            const SizedBox(width: 20),
            Expanded(child: pages.last),
          ],
        );
      },
    );
  }
}

class _VersePage extends StatelessWidget {
  const _VersePage({
    required this.reference,
    required this.text,
    required this.fontScale,
  });

  final String reference;
  final String text;
  final double fontScale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(reference, style: theme.textTheme.titleMedium),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  text,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 24 * fontScale,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChapterReader extends StatelessWidget {
  const _ChapterReader({required this.verses, required this.fontScale});

  final AsyncValue<List<BibleVerse>> verses;
  final double fontScale;

  @override
  Widget build(BuildContext context) {
    return _VersePage(
      reference: _chapterReference(verses),
      text: _chapterText(verses),
      fontScale: fontScale,
    );
  }
}

class _SplitPanel extends StatelessWidget {
  const _SplitPanel({
    required this.currentVerse,
    required this.nextVerse,
    required this.fontScale,
  });

  final AsyncValue<BibleVerse?> currentVerse;
  final AsyncValue<BibleVerse?> nextVerse;
  final double fontScale;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _VersePage(
            reference: '${_verseReference(currentVerse, 'Actual')} - RV1909',
            text: _verseText(currentVerse),
            fontScale: fontScale,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: _VersePage(
            reference: '${_verseReference(nextVerse, 'Siguiente')} - RV1909',
            text: _verseText(nextVerse),
            fontScale: fontScale,
          ),
        ),
      ],
    );
  }
}

String _verseReference(AsyncValue<BibleVerse?> value, String fallback) {
  return value.when(
    data: (verse) => verse?.reference.label ?? fallback,
    loading: () => 'Cargando...',
    error: (_, _) => 'Sin datos',
  );
}

String _verseText(AsyncValue<BibleVerse?> value) {
  return value.when(
    data: (verse) =>
        verse?.text ?? 'No se encontro este versiculo en la base SQLite local.',
    loading: () => 'Cargando texto biblico...',
    error: (error, _) => 'No se pudo cargar el texto biblico: $error',
  );
}

String _chapterReference(AsyncValue<List<BibleVerse>> value) {
  return value.when(
    data: (verses) {
      if (verses.isEmpty) {
        return 'Capitulo';
      }
      final reference = verses.first.reference;
      return '${reference.bookName} ${reference.chapter}';
    },
    loading: () => 'Cargando...',
    error: (_, _) => 'Sin datos',
  );
}

String _chapterText(AsyncValue<List<BibleVerse>> value) {
  return value.when(
    data: (verses) {
      if (verses.isEmpty) {
        return 'No se encontraron versiculos para este capitulo.';
      }
      return verses
          .map((verse) => '${verse.reference.verse}. ${verse.text}')
          .join('\n\n');
    },
    loading: () => 'Cargando capitulo...',
    error: (error, _) => 'No se pudo cargar el capitulo: $error',
  );
}
