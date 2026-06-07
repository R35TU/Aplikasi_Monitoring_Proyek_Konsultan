import 'package:drift/drift.dart';
import 'perusahaan_table.dart';

class Users extends Table {
  TextColumn get firebaseUid => text()();
  TextColumn get nama => text()();
  TextColumn get username => text().nullable()();
  TextColumn get peran => text()();
  IntColumn get perusahaanId =>
      integer().nullable().references(Perusahaan, #id)();
  TextColumn get nomorHp => text().nullable()();
  TextColumn get password => text().nullable()();

  @override
  Set<Column> get primaryKey => {firebaseUid};
}
