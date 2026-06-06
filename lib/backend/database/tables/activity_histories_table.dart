import 'package:drift/drift.dart';
import 'users_table.dart';

class ActivityHistories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text().nullable().references(
    Users,
    #firebaseUid,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get action => text()(); // CREATE, UPDATE, DELETE
  TextColumn get entityType => text()(); // Report, Project, Document
  TextColumn get entityId => text()();
  TextColumn get description => text()();
  TextColumn get timestamp => text()(); // ISO8601 string
}
