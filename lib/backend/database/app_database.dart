import 'package:drift/drift.dart';
import 'package:my_app/backend/database/tables/document_folders_table.dart';
import 'package:my_app/backend/database/tables/login_history_table.dart';
import 'package:my_app/backend/database/tables/perusahaan_table.dart';
import 'package:my_app/backend/database/tables/project_documents_table.dart';
import 'package:my_app/backend/database/tables/project_logs_table.dart';
import 'package:my_app/backend/database/tables/project_teams_table.dart';
import 'package:my_app/backend/database/tables/projects_table.dart';
import 'package:my_app/backend/database/tables/report_materials_table.dart';
import 'package:my_app/backend/database/tables/report_photos_table.dart';
import 'package:my_app/backend/database/tables/reports_table.dart';
import 'package:my_app/backend/database/tables/tasks_table.dart';
import 'package:my_app/backend/database/tables/users_table.dart';
import 'package:my_app/backend/database/tables/activity_histories_table.dart';
import 'connection/connection.dart' as impl;

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    Perusahaan,
    Projects,
    Reports,
    Tasks,
    ReportMaterials,
    ReportPhotos,
    ProjectTeams,
    DocumentFolders,
    ProjectDocuments,
    ProjectLogs,
    LoginHistory,
    ActivityHistories,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.connect());

  @override
  int get schemaVersion => 2;
}
