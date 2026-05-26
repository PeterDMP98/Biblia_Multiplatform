import '../value_objects/verse_reference.dart';

class BibleVerse {
  const BibleVerse({
    required this.versionId,
    required this.reference,
    required this.text,
  });

  final String versionId;
  final VerseReference reference;
  final String text;
}
