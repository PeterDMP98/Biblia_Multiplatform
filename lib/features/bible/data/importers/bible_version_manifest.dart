import 'bible_import_document.dart';

const bibleVersionManifests = <String, BibleImportVersion>{
  'rv1909': BibleImportVersion(
    id: 'rv1909',
    name: 'Reina-Valera 1909',
    abbreviation: 'RV1909',
    language: 'es',
    license: 'public_domain',
    source: 'https://ebible.org/details.php?id=spaRV1909',
  ),
  'asv': BibleImportVersion(
    id: 'asv',
    name: 'American Standard Version 1901',
    abbreviation: 'ASV',
    language: 'en',
    license: 'public_domain',
    source: 'https://ebible.org/details.php?id=eng-asv',
  ),
  'kjv': BibleImportVersion(
    id: 'kjv',
    name: 'King James Version 1769',
    abbreviation: 'KJV',
    language: 'en',
    license: 'public_domain_with_uk_restriction',
    source: 'https://ebible.org/details.php?id=eng-kjv',
  ),
  'web': BibleImportVersion(
    id: 'web',
    name: 'World English Bible',
    abbreviation: 'WEB',
    language: 'en',
    license: 'public_domain',
    source: 'https://ebible.org/details.php?id=engwebp',
  ),
};
