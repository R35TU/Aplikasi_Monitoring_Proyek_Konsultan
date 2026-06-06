import 'package:drift/drift.dart';
import 'projects_table.dart';
import 'users_table.dart';

class Reports extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get proyekId =>
      integer().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get pengawasId => text().nullable().references(
    Users,
    #firebaseUid,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get tanggal => text()();
  TextColumn get deskripsi => text().nullable()();
  TextColumn get fotoUrl => text().nullable()();
  IntColumn get progress =>
      integer().withDefault(const Constant(0))(); // Nilai 0-100 untuk Kurva S
  TextColumn get status => text().withDefault(
    const Constant('draft'),
  )(); // FSM: draft, submitted, approved, rejected
}
