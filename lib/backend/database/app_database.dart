import 'package:drift/drift.dart';
import 'tables/users_table.dart';
import 'tables/projects_table.dart';
import 'tables/reports_table.dart';
import 'tables/tasks_table.dart';
import 'tables/activity_histories_table.dart';
import 'tables/documents_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Users, Projects, Reports, Tasks, ActivityHistories, Documents])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 2;
}
