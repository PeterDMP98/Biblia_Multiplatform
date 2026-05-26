import 'dart:io';

import 'package:sqlite3/sqlite3.dart';

void main(List<String> arguments) {
  if (arguments.length != 1) {
    stderr.writeln('Usage: dart run tool/inspect_bible_database.dart <sqlite>');
    exitCode = 64;
    return;
  }

  final file = File(arguments.first);
  if (!file.existsSync()) {
    stderr.writeln('Database not found: ${file.path}');
    exitCode = 66;
    return;
  }

  final database = sqlite3.open(file.path);
  try {
    final versions = database.select('''
      select version_id, count(*) as verses
      from bible_verses
      group by version_id
      order by version_id;
    ''');

    for (final row in versions) {
      stdout.writeln('${row['version_id']}: ${row['verses']} verses');
    }
  } finally {
    database.close();
  }
}
