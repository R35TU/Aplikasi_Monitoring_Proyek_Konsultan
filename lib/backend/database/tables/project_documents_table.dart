import 'package:drift/drift.dart';
import 'projects_table.dart';
import 'document_folders_table.dart';
import 'users_table.dart';

class ProjectDocuments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get proyekId => integer().references(Projects, #id)();
  IntColumn get folderId => integer().references(DocumentFolders, #id)();
  TextColumn get namaFile => text()();
  TextColumn get fileUrl => text()();
  TextColumn get diunggahOleh => text().references(Users, #firebaseUid)();
  TextColumn get tanggalUnggah => text()();
}
