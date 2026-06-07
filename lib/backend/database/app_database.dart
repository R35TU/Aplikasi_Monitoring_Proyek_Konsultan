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
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

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
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // Cari folder penyimpanan yang aman di HP (Android/iOS)
    final dbFolder = await getApplicationDocumentsDirectory();

    // Buat file fisik bernama 'tata_saka.db'
    final file = File(p.join(dbFolder.path, 'tata_saka.db'));

    return NativeDatabase.createInBackground(file);
  });
}
