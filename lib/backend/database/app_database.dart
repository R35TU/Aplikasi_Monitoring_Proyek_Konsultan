import 'package:drift/drift.dart';

import 'connection/native.dart' if (dart.library.html) 'connection/web.dart';

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
  ],
)
class AppDatabase extends _$AppDatabase {
  // Panggil openConnection() dari file connection yang kita buat tadi (TANPA underscore)
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;
}
