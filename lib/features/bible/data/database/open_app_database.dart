import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'app_database.dart';

AppDatabase openAppDatabase() {
  return AppDatabase(
    LazyDatabase(() async {
      final devDatabase = File(
        p.join(Directory.current.path, 'data', 'generated', 'bibles.sqlite'),
      );
      if (devDatabase.existsSync()) {
        return NativeDatabase.createInBackground(devDatabase);
      }

      final directory = await getApplicationSupportDirectory();
      final file = File(p.join(directory.path, 'biblia_multiplatform.sqlite'));
      return NativeDatabase.createInBackground(file);
    }),
  );
}
