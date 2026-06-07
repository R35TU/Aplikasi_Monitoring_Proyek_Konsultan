import 'package:drift/drift.dart';
import 'projects_table.dart';
import 'users_table.dart';

class ProjectTeams extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get proyekId => integer().references(Projects, #id)();
  TextColumn get userId => text().references(Users, #firebaseUid)();
  TextColumn get peranDiProyek => text()();
}
