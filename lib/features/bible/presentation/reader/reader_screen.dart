import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/reader/reader_controller.dart';
import '../../application/reader/reading_mode.dart';

class ReaderScreen extends ConsumerWidget {
  const ReaderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reader = ref.watch(readerControllerProvider);
    final controller = ref.read(readerControllerProvider.notifier);
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
                        ReadingMode.chapter => const _ChapterMock(),
                        ReadingMode.focusedVerseSpread => _VerseSpreadMock(
                          fontScale: reader.fontScale,
                          reference: reader.currentReference.label,
                        ),
                        ReadingMode.splitPanel => _SplitPanelMock(
                          reference: reader.currentReference.label,
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

class _VerseSpreadMock extends StatelessWidget {
  const _VerseSpreadMock({required this.fontScale, required this.reference});

  final double fontScale;
  final String reference;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final pages = [
          _VersePage(
            reference: reference,
            text:
                'Porque de tal manera amo Dios al mundo, que ha dado a su Hijo unigenito, para que todo aquel que en el cree, no se pierda, mas tenga vida eterna.',
            fontScale: fontScale,
          ),
          _VersePage(
            reference: 'Juan 3:17',
            text:
                'Porque no envio Dios a su Hijo al mundo para que condene al mundo, mas para que el mundo sea salvo por el.',
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

class _ChapterMock extends StatelessWidget {
  const _ChapterMock();

  @override
  Widget build(BuildContext context) {
    return const _VersePage(
      reference: 'Juan 3',
      text:
          'Habia un hombre de los Fariseos que se llamaba Nicodemo, principe de los Judios. Este vino a Jesus de noche, y dijole: Rabbi, sabemos que has venido de Dios por maestro.',
      fontScale: 1,
    );
  }
}

class _SplitPanelMock extends StatelessWidget {
  const _SplitPanelMock({required this.reference});

  final String reference;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _VersePage(
            reference: '$reference - RV1909',
            text:
                'Porque de tal manera amo Dios al mundo, que ha dado a su Hijo unigenito.',
            fontScale: 1,
          ),
        ),
        const SizedBox(width: 20),
        const Expanded(
          child: _VersePage(
            reference: 'John 3:16 - WEB',
            text:
                'For God so loved the world, that he gave his one and only Son.',
            fontScale: 1,
          ),
        ),
      ],
    );
  }
}
