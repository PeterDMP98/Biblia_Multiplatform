import 'dart:convert';
import 'dart:io';

import 'package:biblia_multiplatform/features/bible/data/database/app_database.dart';
import 'package:biblia_multiplatform/features/bible/data/importers/bible_import_database_writer.dart';
import 'package:biblia_multiplatform/features/bible/data/importers/bible_version_manifest.dart';
import 'package:biblia_multiplatform/features/bible/data/importers/usfx_bible_parser.dart';
import 'package:drift/native.dart';

Future<void> main(List<String> arguments) async {
  final args = _ImportArgs.parse(arguments);
  if (args == null) {
    _printUsage();
    exitCode = 64;
    return;
  }

  final version = bibleVersionManifests[args.versionId];
  if (version == null) {
    stderr.writeln('Unknown version: ${args.versionId}');
    stderr.writeln('Known versions: ${bibleVersionManifests.keys.join(', ')}');
    exitCode = 64;
    return;
  }

  final inputFile = File(args.inputPath);
  if (!inputFile.existsSync()) {
    stderr.writeln('Input file not found: ${inputFile.path}');
    exitCode = 66;
    return;
  }

  final parser = UsfxBibleParser();
  final document = parser.parse(
    xmlSource: await inputFile.readAsString(),
    version: version,
  );

  if (args.jsonOutputPath != null) {
    final outputFile = File(args.jsonOutputPath!);
    outputFile.parent.createSync(recursive: true);
    await outputFile.writeAsString(
      const JsonEncoder.withIndent('  ').convert(document.toJson()),
    );
  }

  if (args.sqliteOutputPath != null) {
    final sqliteFile = File(args.sqliteOutputPath!);
    sqliteFile.parent.createSync(recursive: true);

    final database = AppDatabase(NativeDatabase(sqliteFile));
    try {
      await BibleImportDatabaseWriter(database).write(document);
    } finally {
      await database.close();
    }
  }

  stdout.writeln(
    'Imported ${document.version.abbreviation}: '
    '${document.books.length} books, ${document.verseCount} verses.',
  );
}

void _printUsage() {
  stdout.writeln('''
Usage:
  dart run tool/import_usfx.dart --version <id> --input <file> [--json <file>] [--sqlite <file>]

Examples:
  dart run tool/import_usfx.dart --version rv1909 --input data/raw/rv1909/usfx/spaRV1909_usfx.xml --json data/generated/rv1909.json
  dart run tool/import_usfx.dart --version rv1909 --input data/raw/rv1909/usfx/spaRV1909_usfx.xml --sqlite data/generated/bibles.sqlite
''');
}

class _ImportArgs {
  const _ImportArgs({
    required this.versionId,
    required this.inputPath,
    this.jsonOutputPath,
    this.sqliteOutputPath,
  });

  final String versionId;
  final String inputPath;
  final String? jsonOutputPath;
  final String? sqliteOutputPath;

  static _ImportArgs? parse(List<String> arguments) {
    final values = <String, String>{};

    for (var i = 0; i < arguments.length; i++) {
      final key = arguments[i];
      if (!key.startsWith('--')) {
        return null;
      }
      if (i + 1 >= arguments.length) {
        return null;
      }
      values[key.substring(2)] = arguments[++i];
    }

    final versionId = values['version'];
    final inputPath = values['input'];
    if (versionId == null || inputPath == null) {
      return null;
    }
    if (values['json'] == null && values['sqlite'] == null) {
      return null;
    }

    return _ImportArgs(
      versionId: versionId,
      inputPath: inputPath,
      jsonOutputPath: values['json'],
      sqliteOutputPath: values['sqlite'],
    );
  }
}
