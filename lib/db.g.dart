// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Note extends DataClass implements Insertable<Note> {
  final int id;
  final String title;
  final String content;
  final DateTime dateAdded;
  final DateTime dateSynced;
  final bool synced;
  Note(
      {@required this.id,
      @required this.title,
      @required this.content,
      this.dateAdded,
      this.dateSynced,
      @required this.synced});
  factory Note.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Note(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
      dateAdded: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_added']),
      dateSynced: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_synced']),
      synced:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}synced']),
    );
  }
  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
      dateSynced: serializer.fromJson<DateTime>(json['dateSynced']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
      'dateSynced': serializer.toJson<DateTime>(dateSynced),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  @override
  NotesCompanion createCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      dateAdded: dateAdded == null && nullToAbsent
          ? const Value.absent()
          : Value(dateAdded),
      dateSynced: dateSynced == null && nullToAbsent
          ? const Value.absent()
          : Value(dateSynced),
      synced:
          synced == null && nullToAbsent ? const Value.absent() : Value(synced),
    );
  }

  Note copyWith(
          {int id,
          String title,
          String content,
          DateTime dateAdded,
          DateTime dateSynced,
          bool synced}) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        dateAdded: dateAdded ?? this.dateAdded,
        dateSynced: dateSynced ?? this.dateSynced,
        synced: synced ?? this.synced,
      );
  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('dateSynced: $dateSynced, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              content.hashCode,
              $mrjc(dateAdded.hashCode,
                  $mrjc(dateSynced.hashCode, synced.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.dateAdded == this.dateAdded &&
          other.dateSynced == this.dateSynced &&
          other.synced == this.synced);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime> dateAdded;
  final Value<DateTime> dateSynced;
  final Value<bool> synced;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.dateSynced = const Value.absent(),
    this.synced = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    @required String content,
    this.dateAdded = const Value.absent(),
    this.dateSynced = const Value.absent(),
    this.synced = const Value.absent(),
  })  : title = Value(title),
        content = Value(content);
  NotesCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> content,
      Value<DateTime> dateAdded,
      Value<DateTime> dateSynced,
      Value<bool> synced}) {
    return NotesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      dateAdded: dateAdded ?? this.dateAdded,
      dateSynced: dateSynced ?? this.dateSynced,
      synced: synced ?? this.synced,
    );
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  final GeneratedDatabase _db;
  final String _alias;
  $NotesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateAddedMeta = const VerificationMeta('dateAdded');
  GeneratedDateTimeColumn _dateAdded;
  @override
  GeneratedDateTimeColumn get dateAdded => _dateAdded ??= _constructDateAdded();
  GeneratedDateTimeColumn _constructDateAdded() {
    return GeneratedDateTimeColumn(
      'date_added',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dateSyncedMeta = const VerificationMeta('dateSynced');
  GeneratedDateTimeColumn _dateSynced;
  @override
  GeneratedDateTimeColumn get dateSynced =>
      _dateSynced ??= _constructDateSynced();
  GeneratedDateTimeColumn _constructDateSynced() {
    return GeneratedDateTimeColumn(
      'date_synced',
      $tableName,
      true,
    );
  }

  final VerificationMeta _syncedMeta = const VerificationMeta('synced');
  GeneratedBoolColumn _synced;
  @override
  GeneratedBoolColumn get synced => _synced ??= _constructSynced();
  GeneratedBoolColumn _constructSynced() {
    return GeneratedBoolColumn('synced', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, content, dateAdded, dateSynced, synced];
  @override
  $NotesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'notes';
  @override
  final String actualTableName = 'notes';
  @override
  VerificationContext validateIntegrity(NotesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (d.content.present) {
      context.handle(_contentMeta,
          content.isAcceptableValue(d.content.value, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (d.dateAdded.present) {
      context.handle(_dateAddedMeta,
          dateAdded.isAcceptableValue(d.dateAdded.value, _dateAddedMeta));
    }
    if (d.dateSynced.present) {
      context.handle(_dateSyncedMeta,
          dateSynced.isAcceptableValue(d.dateSynced.value, _dateSyncedMeta));
    }
    if (d.synced.present) {
      context.handle(
          _syncedMeta, synced.isAcceptableValue(d.synced.value, _syncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Note.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(NotesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.content.present) {
      map['content'] = Variable<String, StringType>(d.content.value);
    }
    if (d.dateAdded.present) {
      map['date_added'] = Variable<DateTime, DateTimeType>(d.dateAdded.value);
    }
    if (d.dateSynced.present) {
      map['date_synced'] = Variable<DateTime, DateTimeType>(d.dateSynced.value);
    }
    if (d.synced.present) {
      map['synced'] = Variable<bool, BoolType>(d.synced.value);
    }
    return map;
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $NotesTable _notes;
  $NotesTable get notes => _notes ??= $NotesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notes];
}
