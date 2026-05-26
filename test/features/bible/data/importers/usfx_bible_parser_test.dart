import 'package:biblia_multiplatform/features/bible/data/importers/bible_import_document.dart';
import 'package:biblia_multiplatform/features/bible/data/importers/usfx_bible_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses USFX books, chapters and verses', () {
    const version = BibleImportVersion(
      id: 'sample',
      name: 'Sample',
      abbreviation: 'SMP',
      language: 'en',
      license: 'test',
    );
    const source = '''
<usfx>
  <book id="JHN">
    <h>John</h>
    <c id="3" />
    <p>
      <v id="16" />
      For God so <w s="G25">loved</w> the world.
      <ve />
      <v id="17" />
      For God did not send his Son to condemn the world.
      <ve />
    </p>
  </book>
</usfx>
''';

    final document = UsfxBibleParser().parse(
      xmlSource: source,
      version: version,
    );

    expect(document.books, hasLength(1));
    expect(document.verseCount, 2);
    expect(document.books.first.id, 'JHN');
    expect(document.books.first.name, 'John');
    expect(document.books.first.chapters.first.number, 3);
    expect(document.books.first.chapters.first.verses.first.number, 16);
    expect(
      document.books.first.chapters.first.verses.first.text,
      'For God so loved the world.',
    );
  });
}
