// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $BibleVersionsTable extends BibleVersions
    with TableInfo<$BibleVersionsTable, BibleVersion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BibleVersionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _abbreviationMeta = const VerificationMeta(
    'abbreviation',
  );
  @override
  late final GeneratedColumn<String> abbreviation = GeneratedColumn<String>(
    'abbreviation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _licenseMeta = const VerificationMeta(
    'license',
  );
  @override
  late final GeneratedColumn<String> license = GeneratedColumn<String>(
    'license',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _importedAtMeta = const VerificationMeta(
    'importedAt',
  );
  @override
  late final GeneratedColumn<DateTime> importedAt = GeneratedColumn<DateTime>(
    'imported_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    abbreviation,
    language,
    license,
    source,
    importedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bible_versions';
  @override
  VerificationContext validateIntegrity(
    Insertable<BibleVersion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('abbreviation')) {
      context.handle(
        _abbreviationMeta,
        abbreviation.isAcceptableOrUnknown(
          data['abbreviation']!,
          _abbreviationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_abbreviationMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('license')) {
      context.handle(
        _licenseMeta,
        license.isAcceptableOrUnknown(data['license']!, _licenseMeta),
      );
    } else if (isInserting) {
      context.missing(_licenseMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('imported_at')) {
      context.handle(
        _importedAtMeta,
        importedAt.isAcceptableOrUnknown(data['imported_at']!, _importedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_importedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BibleVersion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BibleVersion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      abbreviation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}abbreviation'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      license: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}license'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      ),
      importedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}imported_at'],
      )!,
    );
  }

  @override
  $BibleVersionsTable createAlias(String alias) {
    return $BibleVersionsTable(attachedDatabase, alias);
  }
}

class BibleVersion extends DataClass implements Insertable<BibleVersion> {
  final String id;
  final String name;
  final String abbreviation;
  final String language;
  final String license;
  final String? source;
  final DateTime importedAt;
  const BibleVersion({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.language,
    required this.license,
    this.source,
    required this.importedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['abbreviation'] = Variable<String>(abbreviation);
    map['language'] = Variable<String>(language);
    map['license'] = Variable<String>(license);
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    map['imported_at'] = Variable<DateTime>(importedAt);
    return map;
  }

  BibleVersionsCompanion toCompanion(bool nullToAbsent) {
    return BibleVersionsCompanion(
      id: Value(id),
      name: Value(name),
      abbreviation: Value(abbreviation),
      language: Value(language),
      license: Value(license),
      source: source == null && nullToAbsent
          ? const Value.absent()
          : Value(source),
      importedAt: Value(importedAt),
    );
  }

  factory BibleVersion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BibleVersion(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      abbreviation: serializer.fromJson<String>(json['abbreviation']),
      language: serializer.fromJson<String>(json['language']),
      license: serializer.fromJson<String>(json['license']),
      source: serializer.fromJson<String?>(json['source']),
      importedAt: serializer.fromJson<DateTime>(json['importedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'abbreviation': serializer.toJson<String>(abbreviation),
      'language': serializer.toJson<String>(language),
      'license': serializer.toJson<String>(license),
      'source': serializer.toJson<String?>(source),
      'importedAt': serializer.toJson<DateTime>(importedAt),
    };
  }

  BibleVersion copyWith({
    String? id,
    String? name,
    String? abbreviation,
    String? language,
    String? license,
    Value<String?> source = const Value.absent(),
    DateTime? importedAt,
  }) => BibleVersion(
    id: id ?? this.id,
    name: name ?? this.name,
    abbreviation: abbreviation ?? this.abbreviation,
    language: language ?? this.language,
    license: license ?? this.license,
    source: source.present ? source.value : this.source,
    importedAt: importedAt ?? this.importedAt,
  );
  BibleVersion copyWithCompanion(BibleVersionsCompanion data) {
    return BibleVersion(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      abbreviation: data.abbreviation.present
          ? data.abbreviation.value
          : this.abbreviation,
      language: data.language.present ? data.language.value : this.language,
      license: data.license.present ? data.license.value : this.license,
      source: data.source.present ? data.source.value : this.source,
      importedAt: data.importedAt.present
          ? data.importedAt.value
          : this.importedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BibleVersion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('abbreviation: $abbreviation, ')
          ..write('language: $language, ')
          ..write('license: $license, ')
          ..write('source: $source, ')
          ..write('importedAt: $importedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    abbreviation,
    language,
    license,
    source,
    importedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BibleVersion &&
          other.id == this.id &&
          other.name == this.name &&
          other.abbreviation == this.abbreviation &&
          other.language == this.language &&
          other.license == this.license &&
          other.source == this.source &&
          other.importedAt == this.importedAt);
}

class BibleVersionsCompanion extends UpdateCompanion<BibleVersion> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> abbreviation;
  final Value<String> language;
  final Value<String> license;
  final Value<String?> source;
  final Value<DateTime> importedAt;
  final Value<int> rowid;
  const BibleVersionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.abbreviation = const Value.absent(),
    this.language = const Value.absent(),
    this.license = const Value.absent(),
    this.source = const Value.absent(),
    this.importedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BibleVersionsCompanion.insert({
    required String id,
    required String name,
    required String abbreviation,
    required String language,
    required String license,
    this.source = const Value.absent(),
    required DateTime importedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       abbreviation = Value(abbreviation),
       language = Value(language),
       license = Value(license),
       importedAt = Value(importedAt);
  static Insertable<BibleVersion> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? abbreviation,
    Expression<String>? language,
    Expression<String>? license,
    Expression<String>? source,
    Expression<DateTime>? importedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (abbreviation != null) 'abbreviation': abbreviation,
      if (language != null) 'language': language,
      if (license != null) 'license': license,
      if (source != null) 'source': source,
      if (importedAt != null) 'imported_at': importedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BibleVersionsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? abbreviation,
    Value<String>? language,
    Value<String>? license,
    Value<String?>? source,
    Value<DateTime>? importedAt,
    Value<int>? rowid,
  }) {
    return BibleVersionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      abbreviation: abbreviation ?? this.abbreviation,
      language: language ?? this.language,
      license: license ?? this.license,
      source: source ?? this.source,
      importedAt: importedAt ?? this.importedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (abbreviation.present) {
      map['abbreviation'] = Variable<String>(abbreviation.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (license.present) {
      map['license'] = Variable<String>(license.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (importedAt.present) {
      map['imported_at'] = Variable<DateTime>(importedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BibleVersionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('abbreviation: $abbreviation, ')
          ..write('language: $language, ')
          ..write('license: $license, ')
          ..write('source: $source, ')
          ..write('importedAt: $importedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BibleBooksTable extends BibleBooks
    with TableInfo<$BibleBooksTable, BibleBook> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BibleBooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bible_books';
  @override
  VerificationContext validateIntegrity(
    Insertable<BibleBook> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BibleBook map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BibleBook(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $BibleBooksTable createAlias(String alias) {
    return $BibleBooksTable(attachedDatabase, alias);
  }
}

class BibleBook extends DataClass implements Insertable<BibleBook> {
  final String id;
  final String name;
  final int sortOrder;
  const BibleBook({
    required this.id,
    required this.name,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  BibleBooksCompanion toCompanion(bool nullToAbsent) {
    return BibleBooksCompanion(
      id: Value(id),
      name: Value(name),
      sortOrder: Value(sortOrder),
    );
  }

  factory BibleBook.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BibleBook(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  BibleBook copyWith({String? id, String? name, int? sortOrder}) => BibleBook(
    id: id ?? this.id,
    name: name ?? this.name,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  BibleBook copyWithCompanion(BibleBooksCompanion data) {
    return BibleBook(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BibleBook(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BibleBook &&
          other.id == this.id &&
          other.name == this.name &&
          other.sortOrder == this.sortOrder);
}

class BibleBooksCompanion extends UpdateCompanion<BibleBook> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const BibleBooksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BibleBooksCompanion.insert({
    required String id,
    required String name,
    required int sortOrder,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       sortOrder = Value(sortOrder);
  static Insertable<BibleBook> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BibleBooksCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return BibleBooksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BibleBooksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BibleChaptersTable extends BibleChapters
    with TableInfo<$BibleChaptersTable, BibleChapter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BibleChaptersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _versionIdMeta = const VerificationMeta(
    'versionId',
  );
  @override
  late final GeneratedColumn<String> versionId = GeneratedColumn<String>(
    'version_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bible_versions (id)',
    ),
  );
  static const VerificationMeta _bookIdMeta = const VerificationMeta('bookId');
  @override
  late final GeneratedColumn<String> bookId = GeneratedColumn<String>(
    'book_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bible_books (id)',
    ),
  );
  static const VerificationMeta _chapterNumberMeta = const VerificationMeta(
    'chapterNumber',
  );
  @override
  late final GeneratedColumn<int> chapterNumber = GeneratedColumn<int>(
    'chapter_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [versionId, bookId, chapterNumber];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bible_chapters';
  @override
  VerificationContext validateIntegrity(
    Insertable<BibleChapter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('version_id')) {
      context.handle(
        _versionIdMeta,
        versionId.isAcceptableOrUnknown(data['version_id']!, _versionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_versionIdMeta);
    }
    if (data.containsKey('book_id')) {
      context.handle(
        _bookIdMeta,
        bookId.isAcceptableOrUnknown(data['book_id']!, _bookIdMeta),
      );
    } else if (isInserting) {
      context.missing(_bookIdMeta);
    }
    if (data.containsKey('chapter_number')) {
      context.handle(
        _chapterNumberMeta,
        chapterNumber.isAcceptableOrUnknown(
          data['chapter_number']!,
          _chapterNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_chapterNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {versionId, bookId, chapterNumber};
  @override
  BibleChapter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BibleChapter(
      versionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}version_id'],
      )!,
      bookId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}book_id'],
      )!,
      chapterNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}chapter_number'],
      )!,
    );
  }

  @override
  $BibleChaptersTable createAlias(String alias) {
    return $BibleChaptersTable(attachedDatabase, alias);
  }
}

class BibleChapter extends DataClass implements Insertable<BibleChapter> {
  final String versionId;
  final String bookId;
  final int chapterNumber;
  const BibleChapter({
    required this.versionId,
    required this.bookId,
    required this.chapterNumber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['version_id'] = Variable<String>(versionId);
    map['book_id'] = Variable<String>(bookId);
    map['chapter_number'] = Variable<int>(chapterNumber);
    return map;
  }

  BibleChaptersCompanion toCompanion(bool nullToAbsent) {
    return BibleChaptersCompanion(
      versionId: Value(versionId),
      bookId: Value(bookId),
      chapterNumber: Value(chapterNumber),
    );
  }

  factory BibleChapter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BibleChapter(
      versionId: serializer.fromJson<String>(json['versionId']),
      bookId: serializer.fromJson<String>(json['bookId']),
      chapterNumber: serializer.fromJson<int>(json['chapterNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'versionId': serializer.toJson<String>(versionId),
      'bookId': serializer.toJson<String>(bookId),
      'chapterNumber': serializer.toJson<int>(chapterNumber),
    };
  }

  BibleChapter copyWith({
    String? versionId,
    String? bookId,
    int? chapterNumber,
  }) => BibleChapter(
    versionId: versionId ?? this.versionId,
    bookId: bookId ?? this.bookId,
    chapterNumber: chapterNumber ?? this.chapterNumber,
  );
  BibleChapter copyWithCompanion(BibleChaptersCompanion data) {
    return BibleChapter(
      versionId: data.versionId.present ? data.versionId.value : this.versionId,
      bookId: data.bookId.present ? data.bookId.value : this.bookId,
      chapterNumber: data.chapterNumber.present
          ? data.chapterNumber.value
          : this.chapterNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BibleChapter(')
          ..write('versionId: $versionId, ')
          ..write('bookId: $bookId, ')
          ..write('chapterNumber: $chapterNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(versionId, bookId, chapterNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BibleChapter &&
          other.versionId == this.versionId &&
          other.bookId == this.bookId &&
          other.chapterNumber == this.chapterNumber);
}

class BibleChaptersCompanion extends UpdateCompanion<BibleChapter> {
  final Value<String> versionId;
  final Value<String> bookId;
  final Value<int> chapterNumber;
  final Value<int> rowid;
  const BibleChaptersCompanion({
    this.versionId = const Value.absent(),
    this.bookId = const Value.absent(),
    this.chapterNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BibleChaptersCompanion.insert({
    required String versionId,
    required String bookId,
    required int chapterNumber,
    this.rowid = const Value.absent(),
  }) : versionId = Value(versionId),
       bookId = Value(bookId),
       chapterNumber = Value(chapterNumber);
  static Insertable<BibleChapter> custom({
    Expression<String>? versionId,
    Expression<String>? bookId,
    Expression<int>? chapterNumber,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (versionId != null) 'version_id': versionId,
      if (bookId != null) 'book_id': bookId,
      if (chapterNumber != null) 'chapter_number': chapterNumber,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BibleChaptersCompanion copyWith({
    Value<String>? versionId,
    Value<String>? bookId,
    Value<int>? chapterNumber,
    Value<int>? rowid,
  }) {
    return BibleChaptersCompanion(
      versionId: versionId ?? this.versionId,
      bookId: bookId ?? this.bookId,
      chapterNumber: chapterNumber ?? this.chapterNumber,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (versionId.present) {
      map['version_id'] = Variable<String>(versionId.value);
    }
    if (bookId.present) {
      map['book_id'] = Variable<String>(bookId.value);
    }
    if (chapterNumber.present) {
      map['chapter_number'] = Variable<int>(chapterNumber.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BibleChaptersCompanion(')
          ..write('versionId: $versionId, ')
          ..write('bookId: $bookId, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BibleVersesTable extends BibleVerses
    with TableInfo<$BibleVersesTable, BibleVerse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BibleVersesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _versionIdMeta = const VerificationMeta(
    'versionId',
  );
  @override
  late final GeneratedColumn<String> versionId = GeneratedColumn<String>(
    'version_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bible_versions (id)',
    ),
  );
  static const VerificationMeta _bookIdMeta = const VerificationMeta('bookId');
  @override
  late final GeneratedColumn<String> bookId = GeneratedColumn<String>(
    'book_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bible_books (id)',
    ),
  );
  static const VerificationMeta _chapterNumberMeta = const VerificationMeta(
    'chapterNumber',
  );
  @override
  late final GeneratedColumn<int> chapterNumber = GeneratedColumn<int>(
    'chapter_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _verseNumberMeta = const VerificationMeta(
    'verseNumber',
  );
  @override
  late final GeneratedColumn<int> verseNumber = GeneratedColumn<int>(
    'verse_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _verseTextMeta = const VerificationMeta(
    'verseText',
  );
  @override
  late final GeneratedColumn<String> verseText = GeneratedColumn<String>(
    'text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _normalizedTextMeta = const VerificationMeta(
    'normalizedText',
  );
  @override
  late final GeneratedColumn<String> normalizedText = GeneratedColumn<String>(
    'normalized_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    versionId,
    bookId,
    chapterNumber,
    verseNumber,
    verseText,
    normalizedText,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bible_verses';
  @override
  VerificationContext validateIntegrity(
    Insertable<BibleVerse> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('version_id')) {
      context.handle(
        _versionIdMeta,
        versionId.isAcceptableOrUnknown(data['version_id']!, _versionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_versionIdMeta);
    }
    if (data.containsKey('book_id')) {
      context.handle(
        _bookIdMeta,
        bookId.isAcceptableOrUnknown(data['book_id']!, _bookIdMeta),
      );
    } else if (isInserting) {
      context.missing(_bookIdMeta);
    }
    if (data.containsKey('chapter_number')) {
      context.handle(
        _chapterNumberMeta,
        chapterNumber.isAcceptableOrUnknown(
          data['chapter_number']!,
          _chapterNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_chapterNumberMeta);
    }
    if (data.containsKey('verse_number')) {
      context.handle(
        _verseNumberMeta,
        verseNumber.isAcceptableOrUnknown(
          data['verse_number']!,
          _verseNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_verseNumberMeta);
    }
    if (data.containsKey('text')) {
      context.handle(
        _verseTextMeta,
        verseText.isAcceptableOrUnknown(data['text']!, _verseTextMeta),
      );
    } else if (isInserting) {
      context.missing(_verseTextMeta);
    }
    if (data.containsKey('normalized_text')) {
      context.handle(
        _normalizedTextMeta,
        normalizedText.isAcceptableOrUnknown(
          data['normalized_text']!,
          _normalizedTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_normalizedTextMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {
    versionId,
    bookId,
    chapterNumber,
    verseNumber,
  };
  @override
  BibleVerse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BibleVerse(
      versionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}version_id'],
      )!,
      bookId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}book_id'],
      )!,
      chapterNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}chapter_number'],
      )!,
      verseNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verse_number'],
      )!,
      verseText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text'],
      )!,
      normalizedText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}normalized_text'],
      )!,
    );
  }

  @override
  $BibleVersesTable createAlias(String alias) {
    return $BibleVersesTable(attachedDatabase, alias);
  }
}

class BibleVerse extends DataClass implements Insertable<BibleVerse> {
  final String versionId;
  final String bookId;
  final int chapterNumber;
  final int verseNumber;
  final String verseText;
  final String normalizedText;
  const BibleVerse({
    required this.versionId,
    required this.bookId,
    required this.chapterNumber,
    required this.verseNumber,
    required this.verseText,
    required this.normalizedText,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['version_id'] = Variable<String>(versionId);
    map['book_id'] = Variable<String>(bookId);
    map['chapter_number'] = Variable<int>(chapterNumber);
    map['verse_number'] = Variable<int>(verseNumber);
    map['text'] = Variable<String>(verseText);
    map['normalized_text'] = Variable<String>(normalizedText);
    return map;
  }

  BibleVersesCompanion toCompanion(bool nullToAbsent) {
    return BibleVersesCompanion(
      versionId: Value(versionId),
      bookId: Value(bookId),
      chapterNumber: Value(chapterNumber),
      verseNumber: Value(verseNumber),
      verseText: Value(verseText),
      normalizedText: Value(normalizedText),
    );
  }

  factory BibleVerse.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BibleVerse(
      versionId: serializer.fromJson<String>(json['versionId']),
      bookId: serializer.fromJson<String>(json['bookId']),
      chapterNumber: serializer.fromJson<int>(json['chapterNumber']),
      verseNumber: serializer.fromJson<int>(json['verseNumber']),
      verseText: serializer.fromJson<String>(json['verseText']),
      normalizedText: serializer.fromJson<String>(json['normalizedText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'versionId': serializer.toJson<String>(versionId),
      'bookId': serializer.toJson<String>(bookId),
      'chapterNumber': serializer.toJson<int>(chapterNumber),
      'verseNumber': serializer.toJson<int>(verseNumber),
      'verseText': serializer.toJson<String>(verseText),
      'normalizedText': serializer.toJson<String>(normalizedText),
    };
  }

  BibleVerse copyWith({
    String? versionId,
    String? bookId,
    int? chapterNumber,
    int? verseNumber,
    String? verseText,
    String? normalizedText,
  }) => BibleVerse(
    versionId: versionId ?? this.versionId,
    bookId: bookId ?? this.bookId,
    chapterNumber: chapterNumber ?? this.chapterNumber,
    verseNumber: verseNumber ?? this.verseNumber,
    verseText: verseText ?? this.verseText,
    normalizedText: normalizedText ?? this.normalizedText,
  );
  BibleVerse copyWithCompanion(BibleVersesCompanion data) {
    return BibleVerse(
      versionId: data.versionId.present ? data.versionId.value : this.versionId,
      bookId: data.bookId.present ? data.bookId.value : this.bookId,
      chapterNumber: data.chapterNumber.present
          ? data.chapterNumber.value
          : this.chapterNumber,
      verseNumber: data.verseNumber.present
          ? data.verseNumber.value
          : this.verseNumber,
      verseText: data.verseText.present ? data.verseText.value : this.verseText,
      normalizedText: data.normalizedText.present
          ? data.normalizedText.value
          : this.normalizedText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BibleVerse(')
          ..write('versionId: $versionId, ')
          ..write('bookId: $bookId, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('verseNumber: $verseNumber, ')
          ..write('verseText: $verseText, ')
          ..write('normalizedText: $normalizedText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    versionId,
    bookId,
    chapterNumber,
    verseNumber,
    verseText,
    normalizedText,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BibleVerse &&
          other.versionId == this.versionId &&
          other.bookId == this.bookId &&
          other.chapterNumber == this.chapterNumber &&
          other.verseNumber == this.verseNumber &&
          other.verseText == this.verseText &&
          other.normalizedText == this.normalizedText);
}

class BibleVersesCompanion extends UpdateCompanion<BibleVerse> {
  final Value<String> versionId;
  final Value<String> bookId;
  final Value<int> chapterNumber;
  final Value<int> verseNumber;
  final Value<String> verseText;
  final Value<String> normalizedText;
  final Value<int> rowid;
  const BibleVersesCompanion({
    this.versionId = const Value.absent(),
    this.bookId = const Value.absent(),
    this.chapterNumber = const Value.absent(),
    this.verseNumber = const Value.absent(),
    this.verseText = const Value.absent(),
    this.normalizedText = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BibleVersesCompanion.insert({
    required String versionId,
    required String bookId,
    required int chapterNumber,
    required int verseNumber,
    required String verseText,
    required String normalizedText,
    this.rowid = const Value.absent(),
  }) : versionId = Value(versionId),
       bookId = Value(bookId),
       chapterNumber = Value(chapterNumber),
       verseNumber = Value(verseNumber),
       verseText = Value(verseText),
       normalizedText = Value(normalizedText);
  static Insertable<BibleVerse> custom({
    Expression<String>? versionId,
    Expression<String>? bookId,
    Expression<int>? chapterNumber,
    Expression<int>? verseNumber,
    Expression<String>? verseText,
    Expression<String>? normalizedText,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (versionId != null) 'version_id': versionId,
      if (bookId != null) 'book_id': bookId,
      if (chapterNumber != null) 'chapter_number': chapterNumber,
      if (verseNumber != null) 'verse_number': verseNumber,
      if (verseText != null) 'text': verseText,
      if (normalizedText != null) 'normalized_text': normalizedText,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BibleVersesCompanion copyWith({
    Value<String>? versionId,
    Value<String>? bookId,
    Value<int>? chapterNumber,
    Value<int>? verseNumber,
    Value<String>? verseText,
    Value<String>? normalizedText,
    Value<int>? rowid,
  }) {
    return BibleVersesCompanion(
      versionId: versionId ?? this.versionId,
      bookId: bookId ?? this.bookId,
      chapterNumber: chapterNumber ?? this.chapterNumber,
      verseNumber: verseNumber ?? this.verseNumber,
      verseText: verseText ?? this.verseText,
      normalizedText: normalizedText ?? this.normalizedText,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (versionId.present) {
      map['version_id'] = Variable<String>(versionId.value);
    }
    if (bookId.present) {
      map['book_id'] = Variable<String>(bookId.value);
    }
    if (chapterNumber.present) {
      map['chapter_number'] = Variable<int>(chapterNumber.value);
    }
    if (verseNumber.present) {
      map['verse_number'] = Variable<int>(verseNumber.value);
    }
    if (verseText.present) {
      map['text'] = Variable<String>(verseText.value);
    }
    if (normalizedText.present) {
      map['normalized_text'] = Variable<String>(normalizedText.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BibleVersesCompanion(')
          ..write('versionId: $versionId, ')
          ..write('bookId: $bookId, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('verseNumber: $verseNumber, ')
          ..write('verseText: $verseText, ')
          ..write('normalizedText: $normalizedText, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReaderPreferencesTable extends ReaderPreferences
    with TableInfo<$ReaderPreferencesTable, ReaderPreference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReaderPreferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _currentBookIdMeta = const VerificationMeta(
    'currentBookId',
  );
  @override
  late final GeneratedColumn<String> currentBookId = GeneratedColumn<String>(
    'current_book_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentChapterMeta = const VerificationMeta(
    'currentChapter',
  );
  @override
  late final GeneratedColumn<int> currentChapter = GeneratedColumn<int>(
    'current_chapter',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentVerseMeta = const VerificationMeta(
    'currentVerse',
  );
  @override
  late final GeneratedColumn<int> currentVerse = GeneratedColumn<int>(
    'current_verse',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _primaryTranslationIdMeta =
      const VerificationMeta('primaryTranslationId');
  @override
  late final GeneratedColumn<String> primaryTranslationId =
      GeneratedColumn<String>(
        'primary_translation_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _secondaryTranslationIdMeta =
      const VerificationMeta('secondaryTranslationId');
  @override
  late final GeneratedColumn<String> secondaryTranslationId =
      GeneratedColumn<String>(
        'secondary_translation_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _readingModeMeta = const VerificationMeta(
    'readingMode',
  );
  @override
  late final GeneratedColumn<String> readingMode = GeneratedColumn<String>(
    'reading_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _splitModeMeta = const VerificationMeta(
    'splitMode',
  );
  @override
  late final GeneratedColumn<String> splitMode = GeneratedColumn<String>(
    'split_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fontScaleMeta = const VerificationMeta(
    'fontScale',
  );
  @override
  late final GeneratedColumn<double> fontScale = GeneratedColumn<double>(
    'font_scale',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSidebarVisibleMeta = const VerificationMeta(
    'isSidebarVisible',
  );
  @override
  late final GeneratedColumn<bool> isSidebarVisible = GeneratedColumn<bool>(
    'is_sidebar_visible',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sidebar_visible" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isNotesPanelVisibleMeta =
      const VerificationMeta('isNotesPanelVisible');
  @override
  late final GeneratedColumn<bool> isNotesPanelVisible = GeneratedColumn<bool>(
    'is_notes_panel_visible',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_notes_panel_visible" IN (0, 1))',
    ),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    currentBookId,
    currentChapter,
    currentVerse,
    primaryTranslationId,
    secondaryTranslationId,
    readingMode,
    splitMode,
    fontScale,
    isSidebarVisible,
    isNotesPanelVisible,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reader_preferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReaderPreference> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('current_book_id')) {
      context.handle(
        _currentBookIdMeta,
        currentBookId.isAcceptableOrUnknown(
          data['current_book_id']!,
          _currentBookIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentBookIdMeta);
    }
    if (data.containsKey('current_chapter')) {
      context.handle(
        _currentChapterMeta,
        currentChapter.isAcceptableOrUnknown(
          data['current_chapter']!,
          _currentChapterMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentChapterMeta);
    }
    if (data.containsKey('current_verse')) {
      context.handle(
        _currentVerseMeta,
        currentVerse.isAcceptableOrUnknown(
          data['current_verse']!,
          _currentVerseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentVerseMeta);
    }
    if (data.containsKey('primary_translation_id')) {
      context.handle(
        _primaryTranslationIdMeta,
        primaryTranslationId.isAcceptableOrUnknown(
          data['primary_translation_id']!,
          _primaryTranslationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_primaryTranslationIdMeta);
    }
    if (data.containsKey('secondary_translation_id')) {
      context.handle(
        _secondaryTranslationIdMeta,
        secondaryTranslationId.isAcceptableOrUnknown(
          data['secondary_translation_id']!,
          _secondaryTranslationIdMeta,
        ),
      );
    }
    if (data.containsKey('reading_mode')) {
      context.handle(
        _readingModeMeta,
        readingMode.isAcceptableOrUnknown(
          data['reading_mode']!,
          _readingModeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_readingModeMeta);
    }
    if (data.containsKey('split_mode')) {
      context.handle(
        _splitModeMeta,
        splitMode.isAcceptableOrUnknown(data['split_mode']!, _splitModeMeta),
      );
    } else if (isInserting) {
      context.missing(_splitModeMeta);
    }
    if (data.containsKey('font_scale')) {
      context.handle(
        _fontScaleMeta,
        fontScale.isAcceptableOrUnknown(data['font_scale']!, _fontScaleMeta),
      );
    } else if (isInserting) {
      context.missing(_fontScaleMeta);
    }
    if (data.containsKey('is_sidebar_visible')) {
      context.handle(
        _isSidebarVisibleMeta,
        isSidebarVisible.isAcceptableOrUnknown(
          data['is_sidebar_visible']!,
          _isSidebarVisibleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isSidebarVisibleMeta);
    }
    if (data.containsKey('is_notes_panel_visible')) {
      context.handle(
        _isNotesPanelVisibleMeta,
        isNotesPanelVisible.isAcceptableOrUnknown(
          data['is_notes_panel_visible']!,
          _isNotesPanelVisibleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isNotesPanelVisibleMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReaderPreference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReaderPreference(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      currentBookId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_book_id'],
      )!,
      currentChapter: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_chapter'],
      )!,
      currentVerse: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_verse'],
      )!,
      primaryTranslationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}primary_translation_id'],
      )!,
      secondaryTranslationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}secondary_translation_id'],
      ),
      readingMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reading_mode'],
      )!,
      splitMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}split_mode'],
      )!,
      fontScale: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}font_scale'],
      )!,
      isSidebarVisible: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sidebar_visible'],
      )!,
      isNotesPanelVisible: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_notes_panel_visible'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ReaderPreferencesTable createAlias(String alias) {
    return $ReaderPreferencesTable(attachedDatabase, alias);
  }
}

class ReaderPreference extends DataClass
    implements Insertable<ReaderPreference> {
  final int id;
  final String currentBookId;
  final int currentChapter;
  final int currentVerse;
  final String primaryTranslationId;
  final String? secondaryTranslationId;
  final String readingMode;
  final String splitMode;
  final double fontScale;
  final bool isSidebarVisible;
  final bool isNotesPanelVisible;
  final DateTime updatedAt;
  const ReaderPreference({
    required this.id,
    required this.currentBookId,
    required this.currentChapter,
    required this.currentVerse,
    required this.primaryTranslationId,
    this.secondaryTranslationId,
    required this.readingMode,
    required this.splitMode,
    required this.fontScale,
    required this.isSidebarVisible,
    required this.isNotesPanelVisible,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['current_book_id'] = Variable<String>(currentBookId);
    map['current_chapter'] = Variable<int>(currentChapter);
    map['current_verse'] = Variable<int>(currentVerse);
    map['primary_translation_id'] = Variable<String>(primaryTranslationId);
    if (!nullToAbsent || secondaryTranslationId != null) {
      map['secondary_translation_id'] = Variable<String>(
        secondaryTranslationId,
      );
    }
    map['reading_mode'] = Variable<String>(readingMode);
    map['split_mode'] = Variable<String>(splitMode);
    map['font_scale'] = Variable<double>(fontScale);
    map['is_sidebar_visible'] = Variable<bool>(isSidebarVisible);
    map['is_notes_panel_visible'] = Variable<bool>(isNotesPanelVisible);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ReaderPreferencesCompanion toCompanion(bool nullToAbsent) {
    return ReaderPreferencesCompanion(
      id: Value(id),
      currentBookId: Value(currentBookId),
      currentChapter: Value(currentChapter),
      currentVerse: Value(currentVerse),
      primaryTranslationId: Value(primaryTranslationId),
      secondaryTranslationId: secondaryTranslationId == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryTranslationId),
      readingMode: Value(readingMode),
      splitMode: Value(splitMode),
      fontScale: Value(fontScale),
      isSidebarVisible: Value(isSidebarVisible),
      isNotesPanelVisible: Value(isNotesPanelVisible),
      updatedAt: Value(updatedAt),
    );
  }

  factory ReaderPreference.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReaderPreference(
      id: serializer.fromJson<int>(json['id']),
      currentBookId: serializer.fromJson<String>(json['currentBookId']),
      currentChapter: serializer.fromJson<int>(json['currentChapter']),
      currentVerse: serializer.fromJson<int>(json['currentVerse']),
      primaryTranslationId: serializer.fromJson<String>(
        json['primaryTranslationId'],
      ),
      secondaryTranslationId: serializer.fromJson<String?>(
        json['secondaryTranslationId'],
      ),
      readingMode: serializer.fromJson<String>(json['readingMode']),
      splitMode: serializer.fromJson<String>(json['splitMode']),
      fontScale: serializer.fromJson<double>(json['fontScale']),
      isSidebarVisible: serializer.fromJson<bool>(json['isSidebarVisible']),
      isNotesPanelVisible: serializer.fromJson<bool>(
        json['isNotesPanelVisible'],
      ),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'currentBookId': serializer.toJson<String>(currentBookId),
      'currentChapter': serializer.toJson<int>(currentChapter),
      'currentVerse': serializer.toJson<int>(currentVerse),
      'primaryTranslationId': serializer.toJson<String>(primaryTranslationId),
      'secondaryTranslationId': serializer.toJson<String?>(
        secondaryTranslationId,
      ),
      'readingMode': serializer.toJson<String>(readingMode),
      'splitMode': serializer.toJson<String>(splitMode),
      'fontScale': serializer.toJson<double>(fontScale),
      'isSidebarVisible': serializer.toJson<bool>(isSidebarVisible),
      'isNotesPanelVisible': serializer.toJson<bool>(isNotesPanelVisible),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ReaderPreference copyWith({
    int? id,
    String? currentBookId,
    int? currentChapter,
    int? currentVerse,
    String? primaryTranslationId,
    Value<String?> secondaryTranslationId = const Value.absent(),
    String? readingMode,
    String? splitMode,
    double? fontScale,
    bool? isSidebarVisible,
    bool? isNotesPanelVisible,
    DateTime? updatedAt,
  }) => ReaderPreference(
    id: id ?? this.id,
    currentBookId: currentBookId ?? this.currentBookId,
    currentChapter: currentChapter ?? this.currentChapter,
    currentVerse: currentVerse ?? this.currentVerse,
    primaryTranslationId: primaryTranslationId ?? this.primaryTranslationId,
    secondaryTranslationId: secondaryTranslationId.present
        ? secondaryTranslationId.value
        : this.secondaryTranslationId,
    readingMode: readingMode ?? this.readingMode,
    splitMode: splitMode ?? this.splitMode,
    fontScale: fontScale ?? this.fontScale,
    isSidebarVisible: isSidebarVisible ?? this.isSidebarVisible,
    isNotesPanelVisible: isNotesPanelVisible ?? this.isNotesPanelVisible,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ReaderPreference copyWithCompanion(ReaderPreferencesCompanion data) {
    return ReaderPreference(
      id: data.id.present ? data.id.value : this.id,
      currentBookId: data.currentBookId.present
          ? data.currentBookId.value
          : this.currentBookId,
      currentChapter: data.currentChapter.present
          ? data.currentChapter.value
          : this.currentChapter,
      currentVerse: data.currentVerse.present
          ? data.currentVerse.value
          : this.currentVerse,
      primaryTranslationId: data.primaryTranslationId.present
          ? data.primaryTranslationId.value
          : this.primaryTranslationId,
      secondaryTranslationId: data.secondaryTranslationId.present
          ? data.secondaryTranslationId.value
          : this.secondaryTranslationId,
      readingMode: data.readingMode.present
          ? data.readingMode.value
          : this.readingMode,
      splitMode: data.splitMode.present ? data.splitMode.value : this.splitMode,
      fontScale: data.fontScale.present ? data.fontScale.value : this.fontScale,
      isSidebarVisible: data.isSidebarVisible.present
          ? data.isSidebarVisible.value
          : this.isSidebarVisible,
      isNotesPanelVisible: data.isNotesPanelVisible.present
          ? data.isNotesPanelVisible.value
          : this.isNotesPanelVisible,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReaderPreference(')
          ..write('id: $id, ')
          ..write('currentBookId: $currentBookId, ')
          ..write('currentChapter: $currentChapter, ')
          ..write('currentVerse: $currentVerse, ')
          ..write('primaryTranslationId: $primaryTranslationId, ')
          ..write('secondaryTranslationId: $secondaryTranslationId, ')
          ..write('readingMode: $readingMode, ')
          ..write('splitMode: $splitMode, ')
          ..write('fontScale: $fontScale, ')
          ..write('isSidebarVisible: $isSidebarVisible, ')
          ..write('isNotesPanelVisible: $isNotesPanelVisible, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    currentBookId,
    currentChapter,
    currentVerse,
    primaryTranslationId,
    secondaryTranslationId,
    readingMode,
    splitMode,
    fontScale,
    isSidebarVisible,
    isNotesPanelVisible,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReaderPreference &&
          other.id == this.id &&
          other.currentBookId == this.currentBookId &&
          other.currentChapter == this.currentChapter &&
          other.currentVerse == this.currentVerse &&
          other.primaryTranslationId == this.primaryTranslationId &&
          other.secondaryTranslationId == this.secondaryTranslationId &&
          other.readingMode == this.readingMode &&
          other.splitMode == this.splitMode &&
          other.fontScale == this.fontScale &&
          other.isSidebarVisible == this.isSidebarVisible &&
          other.isNotesPanelVisible == this.isNotesPanelVisible &&
          other.updatedAt == this.updatedAt);
}

class ReaderPreferencesCompanion extends UpdateCompanion<ReaderPreference> {
  final Value<int> id;
  final Value<String> currentBookId;
  final Value<int> currentChapter;
  final Value<int> currentVerse;
  final Value<String> primaryTranslationId;
  final Value<String?> secondaryTranslationId;
  final Value<String> readingMode;
  final Value<String> splitMode;
  final Value<double> fontScale;
  final Value<bool> isSidebarVisible;
  final Value<bool> isNotesPanelVisible;
  final Value<DateTime> updatedAt;
  const ReaderPreferencesCompanion({
    this.id = const Value.absent(),
    this.currentBookId = const Value.absent(),
    this.currentChapter = const Value.absent(),
    this.currentVerse = const Value.absent(),
    this.primaryTranslationId = const Value.absent(),
    this.secondaryTranslationId = const Value.absent(),
    this.readingMode = const Value.absent(),
    this.splitMode = const Value.absent(),
    this.fontScale = const Value.absent(),
    this.isSidebarVisible = const Value.absent(),
    this.isNotesPanelVisible = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ReaderPreferencesCompanion.insert({
    this.id = const Value.absent(),
    required String currentBookId,
    required int currentChapter,
    required int currentVerse,
    required String primaryTranslationId,
    this.secondaryTranslationId = const Value.absent(),
    required String readingMode,
    required String splitMode,
    required double fontScale,
    required bool isSidebarVisible,
    required bool isNotesPanelVisible,
    required DateTime updatedAt,
  }) : currentBookId = Value(currentBookId),
       currentChapter = Value(currentChapter),
       currentVerse = Value(currentVerse),
       primaryTranslationId = Value(primaryTranslationId),
       readingMode = Value(readingMode),
       splitMode = Value(splitMode),
       fontScale = Value(fontScale),
       isSidebarVisible = Value(isSidebarVisible),
       isNotesPanelVisible = Value(isNotesPanelVisible),
       updatedAt = Value(updatedAt);
  static Insertable<ReaderPreference> custom({
    Expression<int>? id,
    Expression<String>? currentBookId,
    Expression<int>? currentChapter,
    Expression<int>? currentVerse,
    Expression<String>? primaryTranslationId,
    Expression<String>? secondaryTranslationId,
    Expression<String>? readingMode,
    Expression<String>? splitMode,
    Expression<double>? fontScale,
    Expression<bool>? isSidebarVisible,
    Expression<bool>? isNotesPanelVisible,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (currentBookId != null) 'current_book_id': currentBookId,
      if (currentChapter != null) 'current_chapter': currentChapter,
      if (currentVerse != null) 'current_verse': currentVerse,
      if (primaryTranslationId != null)
        'primary_translation_id': primaryTranslationId,
      if (secondaryTranslationId != null)
        'secondary_translation_id': secondaryTranslationId,
      if (readingMode != null) 'reading_mode': readingMode,
      if (splitMode != null) 'split_mode': splitMode,
      if (fontScale != null) 'font_scale': fontScale,
      if (isSidebarVisible != null) 'is_sidebar_visible': isSidebarVisible,
      if (isNotesPanelVisible != null)
        'is_notes_panel_visible': isNotesPanelVisible,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ReaderPreferencesCompanion copyWith({
    Value<int>? id,
    Value<String>? currentBookId,
    Value<int>? currentChapter,
    Value<int>? currentVerse,
    Value<String>? primaryTranslationId,
    Value<String?>? secondaryTranslationId,
    Value<String>? readingMode,
    Value<String>? splitMode,
    Value<double>? fontScale,
    Value<bool>? isSidebarVisible,
    Value<bool>? isNotesPanelVisible,
    Value<DateTime>? updatedAt,
  }) {
    return ReaderPreferencesCompanion(
      id: id ?? this.id,
      currentBookId: currentBookId ?? this.currentBookId,
      currentChapter: currentChapter ?? this.currentChapter,
      currentVerse: currentVerse ?? this.currentVerse,
      primaryTranslationId: primaryTranslationId ?? this.primaryTranslationId,
      secondaryTranslationId:
          secondaryTranslationId ?? this.secondaryTranslationId,
      readingMode: readingMode ?? this.readingMode,
      splitMode: splitMode ?? this.splitMode,
      fontScale: fontScale ?? this.fontScale,
      isSidebarVisible: isSidebarVisible ?? this.isSidebarVisible,
      isNotesPanelVisible: isNotesPanelVisible ?? this.isNotesPanelVisible,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (currentBookId.present) {
      map['current_book_id'] = Variable<String>(currentBookId.value);
    }
    if (currentChapter.present) {
      map['current_chapter'] = Variable<int>(currentChapter.value);
    }
    if (currentVerse.present) {
      map['current_verse'] = Variable<int>(currentVerse.value);
    }
    if (primaryTranslationId.present) {
      map['primary_translation_id'] = Variable<String>(
        primaryTranslationId.value,
      );
    }
    if (secondaryTranslationId.present) {
      map['secondary_translation_id'] = Variable<String>(
        secondaryTranslationId.value,
      );
    }
    if (readingMode.present) {
      map['reading_mode'] = Variable<String>(readingMode.value);
    }
    if (splitMode.present) {
      map['split_mode'] = Variable<String>(splitMode.value);
    }
    if (fontScale.present) {
      map['font_scale'] = Variable<double>(fontScale.value);
    }
    if (isSidebarVisible.present) {
      map['is_sidebar_visible'] = Variable<bool>(isSidebarVisible.value);
    }
    if (isNotesPanelVisible.present) {
      map['is_notes_panel_visible'] = Variable<bool>(isNotesPanelVisible.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReaderPreferencesCompanion(')
          ..write('id: $id, ')
          ..write('currentBookId: $currentBookId, ')
          ..write('currentChapter: $currentChapter, ')
          ..write('currentVerse: $currentVerse, ')
          ..write('primaryTranslationId: $primaryTranslationId, ')
          ..write('secondaryTranslationId: $secondaryTranslationId, ')
          ..write('readingMode: $readingMode, ')
          ..write('splitMode: $splitMode, ')
          ..write('fontScale: $fontScale, ')
          ..write('isSidebarVisible: $isSidebarVisible, ')
          ..write('isNotesPanelVisible: $isNotesPanelVisible, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BibleVersionsTable bibleVersions = $BibleVersionsTable(this);
  late final $BibleBooksTable bibleBooks = $BibleBooksTable(this);
  late final $BibleChaptersTable bibleChapters = $BibleChaptersTable(this);
  late final $BibleVersesTable bibleVerses = $BibleVersesTable(this);
  late final $ReaderPreferencesTable readerPreferences =
      $ReaderPreferencesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    bibleVersions,
    bibleBooks,
    bibleChapters,
    bibleVerses,
    readerPreferences,
  ];
}

typedef $$BibleVersionsTableCreateCompanionBuilder =
    BibleVersionsCompanion Function({
      required String id,
      required String name,
      required String abbreviation,
      required String language,
      required String license,
      Value<String?> source,
      required DateTime importedAt,
      Value<int> rowid,
    });
typedef $$BibleVersionsTableUpdateCompanionBuilder =
    BibleVersionsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> abbreviation,
      Value<String> language,
      Value<String> license,
      Value<String?> source,
      Value<DateTime> importedAt,
      Value<int> rowid,
    });

final class $$BibleVersionsTableReferences
    extends BaseReferences<_$AppDatabase, $BibleVersionsTable, BibleVersion> {
  $$BibleVersionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$BibleChaptersTable, List<BibleChapter>>
  _bibleChaptersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.bibleChapters,
    aliasName: $_aliasNameGenerator(
      db.bibleVersions.id,
      db.bibleChapters.versionId,
    ),
  );

  $$BibleChaptersTableProcessedTableManager get bibleChaptersRefs {
    final manager = $$BibleChaptersTableTableManager(
      $_db,
      $_db.bibleChapters,
    ).filter((f) => f.versionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_bibleChaptersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BibleVersesTable, List<BibleVerse>>
  _bibleVersesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.bibleVerses,
    aliasName: $_aliasNameGenerator(
      db.bibleVersions.id,
      db.bibleVerses.versionId,
    ),
  );

  $$BibleVersesTableProcessedTableManager get bibleVersesRefs {
    final manager = $$BibleVersesTableTableManager(
      $_db,
      $_db.bibleVerses,
    ).filter((f) => f.versionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_bibleVersesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BibleVersionsTableFilterComposer
    extends Composer<_$AppDatabase, $BibleVersionsTable> {
  $$BibleVersionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get abbreviation => $composableBuilder(
    column: $table.abbreviation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get license => $composableBuilder(
    column: $table.license,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get importedAt => $composableBuilder(
    column: $table.importedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> bibleChaptersRefs(
    Expression<bool> Function($$BibleChaptersTableFilterComposer f) f,
  ) {
    final $$BibleChaptersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bibleChapters,
      getReferencedColumn: (t) => t.versionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleChaptersTableFilterComposer(
            $db: $db,
            $table: $db.bibleChapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> bibleVersesRefs(
    Expression<bool> Function($$BibleVersesTableFilterComposer f) f,
  ) {
    final $$BibleVersesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bibleVerses,
      getReferencedColumn: (t) => t.versionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleVersesTableFilterComposer(
            $db: $db,
            $table: $db.bibleVerses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BibleVersionsTableOrderingComposer
    extends Composer<_$AppDatabase, $BibleVersionsTable> {
  $$BibleVersionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get abbreviation => $composableBuilder(
    column: $table.abbreviation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get license => $composableBuilder(
    column: $table.license,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get importedAt => $composableBuilder(
    column: $table.importedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BibleVersionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BibleVersionsTable> {
  $$BibleVersionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get abbreviation => $composableBuilder(
    column: $table.abbreviation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get license =>
      $composableBuilder(column: $table.license, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get importedAt => $composableBuilder(
    column: $table.importedAt,
    builder: (column) => column,
  );

  Expression<T> bibleChaptersRefs<T extends Object>(
    Expression<T> Function($$BibleChaptersTableAnnotationComposer a) f,
  ) {
    final $$BibleChaptersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bibleChapters,
      getReferencedColumn: (t) => t.versionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleChaptersTableAnnotationComposer(
            $db: $db,
            $table: $db.bibleChapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> bibleVersesRefs<T extends Object>(
    Expression<T> Function($$BibleVersesTableAnnotationComposer a) f,
  ) {
    final $$BibleVersesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bibleVerses,
      getReferencedColumn: (t) => t.versionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleVersesTableAnnotationComposer(
            $db: $db,
            $table: $db.bibleVerses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BibleVersionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BibleVersionsTable,
          BibleVersion,
          $$BibleVersionsTableFilterComposer,
          $$BibleVersionsTableOrderingComposer,
          $$BibleVersionsTableAnnotationComposer,
          $$BibleVersionsTableCreateCompanionBuilder,
          $$BibleVersionsTableUpdateCompanionBuilder,
          (BibleVersion, $$BibleVersionsTableReferences),
          BibleVersion,
          PrefetchHooks Function({bool bibleChaptersRefs, bool bibleVersesRefs})
        > {
  $$BibleVersionsTableTableManager(_$AppDatabase db, $BibleVersionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BibleVersionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BibleVersionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BibleVersionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> abbreviation = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> license = const Value.absent(),
                Value<String?> source = const Value.absent(),
                Value<DateTime> importedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BibleVersionsCompanion(
                id: id,
                name: name,
                abbreviation: abbreviation,
                language: language,
                license: license,
                source: source,
                importedAt: importedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String abbreviation,
                required String language,
                required String license,
                Value<String?> source = const Value.absent(),
                required DateTime importedAt,
                Value<int> rowid = const Value.absent(),
              }) => BibleVersionsCompanion.insert(
                id: id,
                name: name,
                abbreviation: abbreviation,
                language: language,
                license: license,
                source: source,
                importedAt: importedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BibleVersionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({bibleChaptersRefs = false, bibleVersesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (bibleChaptersRefs) db.bibleChapters,
                    if (bibleVersesRefs) db.bibleVerses,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (bibleChaptersRefs)
                        await $_getPrefetchedData<
                          BibleVersion,
                          $BibleVersionsTable,
                          BibleChapter
                        >(
                          currentTable: table,
                          referencedTable: $$BibleVersionsTableReferences
                              ._bibleChaptersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BibleVersionsTableReferences(
                                db,
                                table,
                                p0,
                              ).bibleChaptersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.versionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (bibleVersesRefs)
                        await $_getPrefetchedData<
                          BibleVersion,
                          $BibleVersionsTable,
                          BibleVerse
                        >(
                          currentTable: table,
                          referencedTable: $$BibleVersionsTableReferences
                              ._bibleVersesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BibleVersionsTableReferences(
                                db,
                                table,
                                p0,
                              ).bibleVersesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.versionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$BibleVersionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BibleVersionsTable,
      BibleVersion,
      $$BibleVersionsTableFilterComposer,
      $$BibleVersionsTableOrderingComposer,
      $$BibleVersionsTableAnnotationComposer,
      $$BibleVersionsTableCreateCompanionBuilder,
      $$BibleVersionsTableUpdateCompanionBuilder,
      (BibleVersion, $$BibleVersionsTableReferences),
      BibleVersion,
      PrefetchHooks Function({bool bibleChaptersRefs, bool bibleVersesRefs})
    >;
typedef $$BibleBooksTableCreateCompanionBuilder =
    BibleBooksCompanion Function({
      required String id,
      required String name,
      required int sortOrder,
      Value<int> rowid,
    });
typedef $$BibleBooksTableUpdateCompanionBuilder =
    BibleBooksCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> sortOrder,
      Value<int> rowid,
    });

final class $$BibleBooksTableReferences
    extends BaseReferences<_$AppDatabase, $BibleBooksTable, BibleBook> {
  $$BibleBooksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BibleChaptersTable, List<BibleChapter>>
  _bibleChaptersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.bibleChapters,
    aliasName: $_aliasNameGenerator(db.bibleBooks.id, db.bibleChapters.bookId),
  );

  $$BibleChaptersTableProcessedTableManager get bibleChaptersRefs {
    final manager = $$BibleChaptersTableTableManager(
      $_db,
      $_db.bibleChapters,
    ).filter((f) => f.bookId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_bibleChaptersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BibleVersesTable, List<BibleVerse>>
  _bibleVersesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.bibleVerses,
    aliasName: $_aliasNameGenerator(db.bibleBooks.id, db.bibleVerses.bookId),
  );

  $$BibleVersesTableProcessedTableManager get bibleVersesRefs {
    final manager = $$BibleVersesTableTableManager(
      $_db,
      $_db.bibleVerses,
    ).filter((f) => f.bookId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_bibleVersesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BibleBooksTableFilterComposer
    extends Composer<_$AppDatabase, $BibleBooksTable> {
  $$BibleBooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> bibleChaptersRefs(
    Expression<bool> Function($$BibleChaptersTableFilterComposer f) f,
  ) {
    final $$BibleChaptersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bibleChapters,
      getReferencedColumn: (t) => t.bookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleChaptersTableFilterComposer(
            $db: $db,
            $table: $db.bibleChapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> bibleVersesRefs(
    Expression<bool> Function($$BibleVersesTableFilterComposer f) f,
  ) {
    final $$BibleVersesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bibleVerses,
      getReferencedColumn: (t) => t.bookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleVersesTableFilterComposer(
            $db: $db,
            $table: $db.bibleVerses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BibleBooksTableOrderingComposer
    extends Composer<_$AppDatabase, $BibleBooksTable> {
  $$BibleBooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BibleBooksTableAnnotationComposer
    extends Composer<_$AppDatabase, $BibleBooksTable> {
  $$BibleBooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  Expression<T> bibleChaptersRefs<T extends Object>(
    Expression<T> Function($$BibleChaptersTableAnnotationComposer a) f,
  ) {
    final $$BibleChaptersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bibleChapters,
      getReferencedColumn: (t) => t.bookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleChaptersTableAnnotationComposer(
            $db: $db,
            $table: $db.bibleChapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> bibleVersesRefs<T extends Object>(
    Expression<T> Function($$BibleVersesTableAnnotationComposer a) f,
  ) {
    final $$BibleVersesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bibleVerses,
      getReferencedColumn: (t) => t.bookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleVersesTableAnnotationComposer(
            $db: $db,
            $table: $db.bibleVerses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BibleBooksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BibleBooksTable,
          BibleBook,
          $$BibleBooksTableFilterComposer,
          $$BibleBooksTableOrderingComposer,
          $$BibleBooksTableAnnotationComposer,
          $$BibleBooksTableCreateCompanionBuilder,
          $$BibleBooksTableUpdateCompanionBuilder,
          (BibleBook, $$BibleBooksTableReferences),
          BibleBook,
          PrefetchHooks Function({bool bibleChaptersRefs, bool bibleVersesRefs})
        > {
  $$BibleBooksTableTableManager(_$AppDatabase db, $BibleBooksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BibleBooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BibleBooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BibleBooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BibleBooksCompanion(
                id: id,
                name: name,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required int sortOrder,
                Value<int> rowid = const Value.absent(),
              }) => BibleBooksCompanion.insert(
                id: id,
                name: name,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BibleBooksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({bibleChaptersRefs = false, bibleVersesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (bibleChaptersRefs) db.bibleChapters,
                    if (bibleVersesRefs) db.bibleVerses,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (bibleChaptersRefs)
                        await $_getPrefetchedData<
                          BibleBook,
                          $BibleBooksTable,
                          BibleChapter
                        >(
                          currentTable: table,
                          referencedTable: $$BibleBooksTableReferences
                              ._bibleChaptersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BibleBooksTableReferences(
                                db,
                                table,
                                p0,
                              ).bibleChaptersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.bookId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (bibleVersesRefs)
                        await $_getPrefetchedData<
                          BibleBook,
                          $BibleBooksTable,
                          BibleVerse
                        >(
                          currentTable: table,
                          referencedTable: $$BibleBooksTableReferences
                              ._bibleVersesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BibleBooksTableReferences(
                                db,
                                table,
                                p0,
                              ).bibleVersesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.bookId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$BibleBooksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BibleBooksTable,
      BibleBook,
      $$BibleBooksTableFilterComposer,
      $$BibleBooksTableOrderingComposer,
      $$BibleBooksTableAnnotationComposer,
      $$BibleBooksTableCreateCompanionBuilder,
      $$BibleBooksTableUpdateCompanionBuilder,
      (BibleBook, $$BibleBooksTableReferences),
      BibleBook,
      PrefetchHooks Function({bool bibleChaptersRefs, bool bibleVersesRefs})
    >;
typedef $$BibleChaptersTableCreateCompanionBuilder =
    BibleChaptersCompanion Function({
      required String versionId,
      required String bookId,
      required int chapterNumber,
      Value<int> rowid,
    });
typedef $$BibleChaptersTableUpdateCompanionBuilder =
    BibleChaptersCompanion Function({
      Value<String> versionId,
      Value<String> bookId,
      Value<int> chapterNumber,
      Value<int> rowid,
    });

final class $$BibleChaptersTableReferences
    extends BaseReferences<_$AppDatabase, $BibleChaptersTable, BibleChapter> {
  $$BibleChaptersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BibleVersionsTable _versionIdTable(_$AppDatabase db) =>
      db.bibleVersions.createAlias(
        $_aliasNameGenerator(db.bibleChapters.versionId, db.bibleVersions.id),
      );

  $$BibleVersionsTableProcessedTableManager get versionId {
    final $_column = $_itemColumn<String>('version_id')!;

    final manager = $$BibleVersionsTableTableManager(
      $_db,
      $_db.bibleVersions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_versionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BibleBooksTable _bookIdTable(_$AppDatabase db) =>
      db.bibleBooks.createAlias(
        $_aliasNameGenerator(db.bibleChapters.bookId, db.bibleBooks.id),
      );

  $$BibleBooksTableProcessedTableManager get bookId {
    final $_column = $_itemColumn<String>('book_id')!;

    final manager = $$BibleBooksTableTableManager(
      $_db,
      $_db.bibleBooks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bookIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BibleChaptersTableFilterComposer
    extends Composer<_$AppDatabase, $BibleChaptersTable> {
  $$BibleChaptersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => ColumnFilters(column),
  );

  $$BibleVersionsTableFilterComposer get versionId {
    final $$BibleVersionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.versionId,
      referencedTable: $db.bibleVersions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleVersionsTableFilterComposer(
            $db: $db,
            $table: $db.bibleVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BibleBooksTableFilterComposer get bookId {
    final $$BibleBooksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.bibleBooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleBooksTableFilterComposer(
            $db: $db,
            $table: $db.bibleBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BibleChaptersTableOrderingComposer
    extends Composer<_$AppDatabase, $BibleChaptersTable> {
  $$BibleChaptersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => ColumnOrderings(column),
  );

  $$BibleVersionsTableOrderingComposer get versionId {
    final $$BibleVersionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.versionId,
      referencedTable: $db.bibleVersions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleVersionsTableOrderingComposer(
            $db: $db,
            $table: $db.bibleVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BibleBooksTableOrderingComposer get bookId {
    final $$BibleBooksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.bibleBooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleBooksTableOrderingComposer(
            $db: $db,
            $table: $db.bibleBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BibleChaptersTableAnnotationComposer
    extends Composer<_$AppDatabase, $BibleChaptersTable> {
  $$BibleChaptersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => column,
  );

  $$BibleVersionsTableAnnotationComposer get versionId {
    final $$BibleVersionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.versionId,
      referencedTable: $db.bibleVersions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleVersionsTableAnnotationComposer(
            $db: $db,
            $table: $db.bibleVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BibleBooksTableAnnotationComposer get bookId {
    final $$BibleBooksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.bibleBooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleBooksTableAnnotationComposer(
            $db: $db,
            $table: $db.bibleBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BibleChaptersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BibleChaptersTable,
          BibleChapter,
          $$BibleChaptersTableFilterComposer,
          $$BibleChaptersTableOrderingComposer,
          $$BibleChaptersTableAnnotationComposer,
          $$BibleChaptersTableCreateCompanionBuilder,
          $$BibleChaptersTableUpdateCompanionBuilder,
          (BibleChapter, $$BibleChaptersTableReferences),
          BibleChapter,
          PrefetchHooks Function({bool versionId, bool bookId})
        > {
  $$BibleChaptersTableTableManager(_$AppDatabase db, $BibleChaptersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BibleChaptersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BibleChaptersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BibleChaptersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> versionId = const Value.absent(),
                Value<String> bookId = const Value.absent(),
                Value<int> chapterNumber = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BibleChaptersCompanion(
                versionId: versionId,
                bookId: bookId,
                chapterNumber: chapterNumber,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String versionId,
                required String bookId,
                required int chapterNumber,
                Value<int> rowid = const Value.absent(),
              }) => BibleChaptersCompanion.insert(
                versionId: versionId,
                bookId: bookId,
                chapterNumber: chapterNumber,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BibleChaptersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({versionId = false, bookId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (versionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.versionId,
                                referencedTable: $$BibleChaptersTableReferences
                                    ._versionIdTable(db),
                                referencedColumn: $$BibleChaptersTableReferences
                                    ._versionIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (bookId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.bookId,
                                referencedTable: $$BibleChaptersTableReferences
                                    ._bookIdTable(db),
                                referencedColumn: $$BibleChaptersTableReferences
                                    ._bookIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BibleChaptersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BibleChaptersTable,
      BibleChapter,
      $$BibleChaptersTableFilterComposer,
      $$BibleChaptersTableOrderingComposer,
      $$BibleChaptersTableAnnotationComposer,
      $$BibleChaptersTableCreateCompanionBuilder,
      $$BibleChaptersTableUpdateCompanionBuilder,
      (BibleChapter, $$BibleChaptersTableReferences),
      BibleChapter,
      PrefetchHooks Function({bool versionId, bool bookId})
    >;
typedef $$BibleVersesTableCreateCompanionBuilder =
    BibleVersesCompanion Function({
      required String versionId,
      required String bookId,
      required int chapterNumber,
      required int verseNumber,
      required String verseText,
      required String normalizedText,
      Value<int> rowid,
    });
typedef $$BibleVersesTableUpdateCompanionBuilder =
    BibleVersesCompanion Function({
      Value<String> versionId,
      Value<String> bookId,
      Value<int> chapterNumber,
      Value<int> verseNumber,
      Value<String> verseText,
      Value<String> normalizedText,
      Value<int> rowid,
    });

final class $$BibleVersesTableReferences
    extends BaseReferences<_$AppDatabase, $BibleVersesTable, BibleVerse> {
  $$BibleVersesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BibleVersionsTable _versionIdTable(_$AppDatabase db) =>
      db.bibleVersions.createAlias(
        $_aliasNameGenerator(db.bibleVerses.versionId, db.bibleVersions.id),
      );

  $$BibleVersionsTableProcessedTableManager get versionId {
    final $_column = $_itemColumn<String>('version_id')!;

    final manager = $$BibleVersionsTableTableManager(
      $_db,
      $_db.bibleVersions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_versionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BibleBooksTable _bookIdTable(_$AppDatabase db) =>
      db.bibleBooks.createAlias(
        $_aliasNameGenerator(db.bibleVerses.bookId, db.bibleBooks.id),
      );

  $$BibleBooksTableProcessedTableManager get bookId {
    final $_column = $_itemColumn<String>('book_id')!;

    final manager = $$BibleBooksTableTableManager(
      $_db,
      $_db.bibleBooks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bookIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BibleVersesTableFilterComposer
    extends Composer<_$AppDatabase, $BibleVersesTable> {
  $$BibleVersesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get verseText => $composableBuilder(
    column: $table.verseText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get normalizedText => $composableBuilder(
    column: $table.normalizedText,
    builder: (column) => ColumnFilters(column),
  );

  $$BibleVersionsTableFilterComposer get versionId {
    final $$BibleVersionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.versionId,
      referencedTable: $db.bibleVersions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleVersionsTableFilterComposer(
            $db: $db,
            $table: $db.bibleVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BibleBooksTableFilterComposer get bookId {
    final $$BibleBooksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.bibleBooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleBooksTableFilterComposer(
            $db: $db,
            $table: $db.bibleBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BibleVersesTableOrderingComposer
    extends Composer<_$AppDatabase, $BibleVersesTable> {
  $$BibleVersesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get verseText => $composableBuilder(
    column: $table.verseText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get normalizedText => $composableBuilder(
    column: $table.normalizedText,
    builder: (column) => ColumnOrderings(column),
  );

  $$BibleVersionsTableOrderingComposer get versionId {
    final $$BibleVersionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.versionId,
      referencedTable: $db.bibleVersions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleVersionsTableOrderingComposer(
            $db: $db,
            $table: $db.bibleVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BibleBooksTableOrderingComposer get bookId {
    final $$BibleBooksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.bibleBooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleBooksTableOrderingComposer(
            $db: $db,
            $table: $db.bibleBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BibleVersesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BibleVersesTable> {
  $$BibleVersesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get verseText =>
      $composableBuilder(column: $table.verseText, builder: (column) => column);

  GeneratedColumn<String> get normalizedText => $composableBuilder(
    column: $table.normalizedText,
    builder: (column) => column,
  );

  $$BibleVersionsTableAnnotationComposer get versionId {
    final $$BibleVersionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.versionId,
      referencedTable: $db.bibleVersions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleVersionsTableAnnotationComposer(
            $db: $db,
            $table: $db.bibleVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BibleBooksTableAnnotationComposer get bookId {
    final $$BibleBooksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.bibleBooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BibleBooksTableAnnotationComposer(
            $db: $db,
            $table: $db.bibleBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BibleVersesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BibleVersesTable,
          BibleVerse,
          $$BibleVersesTableFilterComposer,
          $$BibleVersesTableOrderingComposer,
          $$BibleVersesTableAnnotationComposer,
          $$BibleVersesTableCreateCompanionBuilder,
          $$BibleVersesTableUpdateCompanionBuilder,
          (BibleVerse, $$BibleVersesTableReferences),
          BibleVerse,
          PrefetchHooks Function({bool versionId, bool bookId})
        > {
  $$BibleVersesTableTableManager(_$AppDatabase db, $BibleVersesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BibleVersesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BibleVersesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BibleVersesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> versionId = const Value.absent(),
                Value<String> bookId = const Value.absent(),
                Value<int> chapterNumber = const Value.absent(),
                Value<int> verseNumber = const Value.absent(),
                Value<String> verseText = const Value.absent(),
                Value<String> normalizedText = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BibleVersesCompanion(
                versionId: versionId,
                bookId: bookId,
                chapterNumber: chapterNumber,
                verseNumber: verseNumber,
                verseText: verseText,
                normalizedText: normalizedText,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String versionId,
                required String bookId,
                required int chapterNumber,
                required int verseNumber,
                required String verseText,
                required String normalizedText,
                Value<int> rowid = const Value.absent(),
              }) => BibleVersesCompanion.insert(
                versionId: versionId,
                bookId: bookId,
                chapterNumber: chapterNumber,
                verseNumber: verseNumber,
                verseText: verseText,
                normalizedText: normalizedText,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BibleVersesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({versionId = false, bookId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (versionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.versionId,
                                referencedTable: $$BibleVersesTableReferences
                                    ._versionIdTable(db),
                                referencedColumn: $$BibleVersesTableReferences
                                    ._versionIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (bookId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.bookId,
                                referencedTable: $$BibleVersesTableReferences
                                    ._bookIdTable(db),
                                referencedColumn: $$BibleVersesTableReferences
                                    ._bookIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BibleVersesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BibleVersesTable,
      BibleVerse,
      $$BibleVersesTableFilterComposer,
      $$BibleVersesTableOrderingComposer,
      $$BibleVersesTableAnnotationComposer,
      $$BibleVersesTableCreateCompanionBuilder,
      $$BibleVersesTableUpdateCompanionBuilder,
      (BibleVerse, $$BibleVersesTableReferences),
      BibleVerse,
      PrefetchHooks Function({bool versionId, bool bookId})
    >;
typedef $$ReaderPreferencesTableCreateCompanionBuilder =
    ReaderPreferencesCompanion Function({
      Value<int> id,
      required String currentBookId,
      required int currentChapter,
      required int currentVerse,
      required String primaryTranslationId,
      Value<String?> secondaryTranslationId,
      required String readingMode,
      required String splitMode,
      required double fontScale,
      required bool isSidebarVisible,
      required bool isNotesPanelVisible,
      required DateTime updatedAt,
    });
typedef $$ReaderPreferencesTableUpdateCompanionBuilder =
    ReaderPreferencesCompanion Function({
      Value<int> id,
      Value<String> currentBookId,
      Value<int> currentChapter,
      Value<int> currentVerse,
      Value<String> primaryTranslationId,
      Value<String?> secondaryTranslationId,
      Value<String> readingMode,
      Value<String> splitMode,
      Value<double> fontScale,
      Value<bool> isSidebarVisible,
      Value<bool> isNotesPanelVisible,
      Value<DateTime> updatedAt,
    });

class $$ReaderPreferencesTableFilterComposer
    extends Composer<_$AppDatabase, $ReaderPreferencesTable> {
  $$ReaderPreferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentBookId => $composableBuilder(
    column: $table.currentBookId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentChapter => $composableBuilder(
    column: $table.currentChapter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentVerse => $composableBuilder(
    column: $table.currentVerse,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get primaryTranslationId => $composableBuilder(
    column: $table.primaryTranslationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get secondaryTranslationId => $composableBuilder(
    column: $table.secondaryTranslationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get readingMode => $composableBuilder(
    column: $table.readingMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get splitMode => $composableBuilder(
    column: $table.splitMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fontScale => $composableBuilder(
    column: $table.fontScale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSidebarVisible => $composableBuilder(
    column: $table.isSidebarVisible,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isNotesPanelVisible => $composableBuilder(
    column: $table.isNotesPanelVisible,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReaderPreferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $ReaderPreferencesTable> {
  $$ReaderPreferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentBookId => $composableBuilder(
    column: $table.currentBookId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentChapter => $composableBuilder(
    column: $table.currentChapter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentVerse => $composableBuilder(
    column: $table.currentVerse,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get primaryTranslationId => $composableBuilder(
    column: $table.primaryTranslationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get secondaryTranslationId => $composableBuilder(
    column: $table.secondaryTranslationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get readingMode => $composableBuilder(
    column: $table.readingMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get splitMode => $composableBuilder(
    column: $table.splitMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fontScale => $composableBuilder(
    column: $table.fontScale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSidebarVisible => $composableBuilder(
    column: $table.isSidebarVisible,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isNotesPanelVisible => $composableBuilder(
    column: $table.isNotesPanelVisible,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReaderPreferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReaderPreferencesTable> {
  $$ReaderPreferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get currentBookId => $composableBuilder(
    column: $table.currentBookId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentChapter => $composableBuilder(
    column: $table.currentChapter,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentVerse => $composableBuilder(
    column: $table.currentVerse,
    builder: (column) => column,
  );

  GeneratedColumn<String> get primaryTranslationId => $composableBuilder(
    column: $table.primaryTranslationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get secondaryTranslationId => $composableBuilder(
    column: $table.secondaryTranslationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get readingMode => $composableBuilder(
    column: $table.readingMode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get splitMode =>
      $composableBuilder(column: $table.splitMode, builder: (column) => column);

  GeneratedColumn<double> get fontScale =>
      $composableBuilder(column: $table.fontScale, builder: (column) => column);

  GeneratedColumn<bool> get isSidebarVisible => $composableBuilder(
    column: $table.isSidebarVisible,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isNotesPanelVisible => $composableBuilder(
    column: $table.isNotesPanelVisible,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ReaderPreferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReaderPreferencesTable,
          ReaderPreference,
          $$ReaderPreferencesTableFilterComposer,
          $$ReaderPreferencesTableOrderingComposer,
          $$ReaderPreferencesTableAnnotationComposer,
          $$ReaderPreferencesTableCreateCompanionBuilder,
          $$ReaderPreferencesTableUpdateCompanionBuilder,
          (
            ReaderPreference,
            BaseReferences<
              _$AppDatabase,
              $ReaderPreferencesTable,
              ReaderPreference
            >,
          ),
          ReaderPreference,
          PrefetchHooks Function()
        > {
  $$ReaderPreferencesTableTableManager(
    _$AppDatabase db,
    $ReaderPreferencesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReaderPreferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReaderPreferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReaderPreferencesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> currentBookId = const Value.absent(),
                Value<int> currentChapter = const Value.absent(),
                Value<int> currentVerse = const Value.absent(),
                Value<String> primaryTranslationId = const Value.absent(),
                Value<String?> secondaryTranslationId = const Value.absent(),
                Value<String> readingMode = const Value.absent(),
                Value<String> splitMode = const Value.absent(),
                Value<double> fontScale = const Value.absent(),
                Value<bool> isSidebarVisible = const Value.absent(),
                Value<bool> isNotesPanelVisible = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ReaderPreferencesCompanion(
                id: id,
                currentBookId: currentBookId,
                currentChapter: currentChapter,
                currentVerse: currentVerse,
                primaryTranslationId: primaryTranslationId,
                secondaryTranslationId: secondaryTranslationId,
                readingMode: readingMode,
                splitMode: splitMode,
                fontScale: fontScale,
                isSidebarVisible: isSidebarVisible,
                isNotesPanelVisible: isNotesPanelVisible,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String currentBookId,
                required int currentChapter,
                required int currentVerse,
                required String primaryTranslationId,
                Value<String?> secondaryTranslationId = const Value.absent(),
                required String readingMode,
                required String splitMode,
                required double fontScale,
                required bool isSidebarVisible,
                required bool isNotesPanelVisible,
                required DateTime updatedAt,
              }) => ReaderPreferencesCompanion.insert(
                id: id,
                currentBookId: currentBookId,
                currentChapter: currentChapter,
                currentVerse: currentVerse,
                primaryTranslationId: primaryTranslationId,
                secondaryTranslationId: secondaryTranslationId,
                readingMode: readingMode,
                splitMode: splitMode,
                fontScale: fontScale,
                isSidebarVisible: isSidebarVisible,
                isNotesPanelVisible: isNotesPanelVisible,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReaderPreferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReaderPreferencesTable,
      ReaderPreference,
      $$ReaderPreferencesTableFilterComposer,
      $$ReaderPreferencesTableOrderingComposer,
      $$ReaderPreferencesTableAnnotationComposer,
      $$ReaderPreferencesTableCreateCompanionBuilder,
      $$ReaderPreferencesTableUpdateCompanionBuilder,
      (
        ReaderPreference,
        BaseReferences<
          _$AppDatabase,
          $ReaderPreferencesTable,
          ReaderPreference
        >,
      ),
      ReaderPreference,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BibleVersionsTableTableManager get bibleVersions =>
      $$BibleVersionsTableTableManager(_db, _db.bibleVersions);
  $$BibleBooksTableTableManager get bibleBooks =>
      $$BibleBooksTableTableManager(_db, _db.bibleBooks);
  $$BibleChaptersTableTableManager get bibleChapters =>
      $$BibleChaptersTableTableManager(_db, _db.bibleChapters);
  $$BibleVersesTableTableManager get bibleVerses =>
      $$BibleVersesTableTableManager(_db, _db.bibleVerses);
  $$ReaderPreferencesTableTableManager get readerPreferences =>
      $$ReaderPreferencesTableTableManager(_db, _db.readerPreferences);
}
