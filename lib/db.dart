import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';

class AppDatabaseUtils {
  AppDatabaseUtils._();

  static LazyDatabase openConnection() {
    // the LazyDatabase util lets us find the right location for the file async.
    return LazyDatabase(() async {
      // put the database file, called db.sqlite here, into the documents folder
      // for your app.
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return VmDatabase(file);
    });
  }
}

class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1)();
  TextColumn get content => text()();
  DateTimeColumn get dateAdded => dateTime().nullable()();
  DateTimeColumn get dateSynced => dateTime().nullable()();
  BoolColumn get synced => boolean().withDefault(Constant(false))();
}

@UseMoor(tables: [Notes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(AppDatabaseUtils.openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Note>> getAllNotes() => select(notes).get();
  Stream<List<Note>> streamAllNotes() => select(notes).watch();
  Future<int> insertNote(Note note) => into(notes).insert(note);
  Future<int> deleteNote(Note note) => delete(notes).delete(note);
}
