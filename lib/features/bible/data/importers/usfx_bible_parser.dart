import 'package:xml/xml.dart';

import 'bible_import_document.dart';

class UsfxBibleParser {
  BibleImportDocument parse({
    required String xmlSource,
    required BibleImportVersion version,
  }) {
    final document = XmlDocument.parse(xmlSource);
    final context = _ParseContext(version: version);

    for (final node in document.rootElement.children) {
      _visit(node, context);
    }

    context.flushVerse();
    context.flushChapter();
    context.flushBook();

    return BibleImportDocument(
      version: version,
      books: List.unmodifiable(context.books),
    );
  }

  void _visit(XmlNode node, _ParseContext context) {
    if (node is XmlText) {
      context.appendText(node.value);
      return;
    }

    if (node is! XmlElement) {
      return;
    }

    final tag = node.name.local;

    if (_ignoredTags.contains(tag)) {
      return;
    }

    switch (tag) {
      case 'book':
        context.startBook(
          id: node.getAttribute('id') ?? '',
          name: _readBookName(node),
        );
        for (final child in node.children) {
          _visit(child, context);
        }
        return;
      case 'c':
        context.startChapter(_readIntAttribute(node, 'id'));
        return;
      case 'v':
        context.startVerse(_readIntAttribute(node, 'id'));
        return;
      case 've':
        context.flushVerse();
        return;
      default:
        for (final child in node.children) {
          _visit(child, context);
        }
        return;
    }
  }

  String _readBookName(XmlElement book) {
    final heading = _firstOrNull(book.findElements('h'))?.innerText.trim();
    if (heading != null && heading.isNotEmpty) {
      return heading;
    }

    final toc = _firstOrNull(
      book
          .findElements('toc')
          .where((element) => element.getAttribute('level') == '1'),
    )?.innerText.trim();
    if (toc != null && toc.isNotEmpty) {
      return toc;
    }

    final id = book.getAttribute('id') ?? '';
    return id.isEmpty ? 'Unknown' : id;
  }

  int _readIntAttribute(XmlElement element, String attributeName) {
    return int.tryParse(element.getAttribute(attributeName) ?? '') ?? 0;
  }

  T? _firstOrNull<T>(Iterable<T> values) {
    final iterator = values.iterator;
    return iterator.moveNext() ? iterator.current : null;
  }
}

const _ignoredTags = {'f', 'fe', 'x', 'xe', 'note', 'rem'};

class _ParseContext {
  _ParseContext({required this.version});

  final BibleImportVersion version;
  final books = <BibleImportBook>[];
  final _chapters = <BibleImportChapter>[];
  final _verses = <BibleImportVerse>[];
  final _verseText = StringBuffer();

  String? _bookId;
  String? _bookName;
  int? _chapterNumber;
  int? _verseNumber;

  void startBook({required String id, required String name}) {
    flushVerse();
    flushChapter();
    flushBook();

    _bookId = id.toUpperCase();
    _bookName = name;
  }

  void startChapter(int number) {
    flushVerse();
    flushChapter();
    _chapterNumber = number;
  }

  void startVerse(int number) {
    flushVerse();
    _verseNumber = number;
    _verseText.clear();
  }

  void appendText(String text) {
    if (_verseNumber == null) {
      return;
    }
    _verseText.write(text);
  }

  void flushVerse() {
    final verseNumber = _verseNumber;
    if (verseNumber == null) {
      return;
    }

    final text = _normalizeVerseText(_verseText.toString());
    if (text.isNotEmpty) {
      _verses.add(BibleImportVerse(number: verseNumber, text: text));
    }

    _verseNumber = null;
    _verseText.clear();
  }

  void flushChapter() {
    final chapterNumber = _chapterNumber;
    if (chapterNumber == null) {
      return;
    }

    if (_verses.isNotEmpty) {
      _chapters.add(
        BibleImportChapter(
          number: chapterNumber,
          verses: List.unmodifiable(_verses),
        ),
      );
    }

    _chapterNumber = null;
    _verses.clear();
  }

  void flushBook() {
    final bookId = _bookId;
    final bookName = _bookName;
    if (bookId == null || bookName == null) {
      return;
    }

    if (_chapters.isNotEmpty) {
      books.add(
        BibleImportBook(
          id: bookId,
          name: bookName,
          order: books.length + 1,
          chapters: List.unmodifiable(_chapters),
        ),
      );
    }

    _bookId = null;
    _bookName = null;
    _chapters.clear();
  }

  String _normalizeVerseText(String text) {
    return text.replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}
