// =============================================================
// FILE   : lib/backend/repositories/project_repository.dart
// TEKNIK : Parameterization (via BaseRepository)
// =============================================================

import 'package:drift/drift.dart';
import '../database/app_database.dart';
import 'base_repository.dart';

class ProjectRepository implements BaseRepository<Project, ProjectsCompanion> {
  final AppDatabase db;

  ProjectRepository(this.db);

  @override
  Future<List<Project>> getAll() async {
    return await db.select(db.projects).get();
  }

  @override
  Future<Project?> getById(int id) async {
    return await (db.select(db.projects)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<int> add(ProjectsCompanion item) async {
    assert(item.namaProyek.present && item.namaProyek.value.isNotEmpty, 'Nama proyek tidak boleh kosong');
    return await db.into(db.projects).insert(item);
  }

  @override
  Future<bool> updateItem(int id, ProjectsCompanion item) async {
    final result = await (db.update(db.projects)..where((tbl) => tbl.id.equals(id))).write(item);
    return result > 0;
  }

  @override
  Future<bool> deleteItem(int id) async {
    final result = await (db.delete(db.projects)..where((tbl) => tbl.id.equals(id))).go();
    return result > 0;
  }

  Future<List<Project>> getByStatus(String status) async {
    return await (db.select(db.projects)..where((tbl) => tbl.status.equals(status))).get();
  }
}
