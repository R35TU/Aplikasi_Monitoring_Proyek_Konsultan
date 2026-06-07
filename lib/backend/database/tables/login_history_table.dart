import 'package:drift/drift.dart';
import 'users_table.dart';

class LoginHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text().references(Users, #firebaseUid)();
  TextColumn get perangkat => text()();
  TextColumn get lokasi => text().nullable()();
  TextColumn get waktuLogin => text()();
}
