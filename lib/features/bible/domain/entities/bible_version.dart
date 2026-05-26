class BibleVersion {
  const BibleVersion({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.language,
    required this.license,
  });

  final String id;
  final String name;
  final String abbreviation;
  final String language;
  final String license;
}
