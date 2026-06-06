import 'package:drift/drift.dart';
import 'projects_table.dart';
import 'users_table.dart';

class Documents extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get proyekId =>
      integer().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get uploaderId => text().nullable().references(
    Users,
    #firebaseUid,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get tipeDokumen => text()(); // shop_drawing, request_of_work, dll
  TextColumn get fileUrl => text()();
  TextColumn get status => text().withDefault(const Constant('pending'))(); // pending, approved, rejected
  TextColumn get tanggalUpload => text()(); // ISO8601 string
}
