import 'package:drift/drift.dart';

class Users extends Table {
  TextColumn get firebaseUid => text()();
  TextColumn get nama => text().withLength(min: 1, max: 100)();
  TextColumn get peran =>
      text()(); // super_admin, admin_lapangan, kontraktor, client, aph
  TextColumn get nomorHp => text().nullable()();

  @override
  Set<Column> get primaryKey => {firebaseUid};
}
