import 'package:drift/drift.dart';
import '../database/app_database.dart';
import 'base_repository.dart';

class ReportRepository implements BaseRepository<Report, ReportsCompanion> {
  final AppDatabase db;

  ReportRepository(this.db);

  @override
  Future<List<Report>> getAll() async {
    return await db.select(db.reports).get();
  }

  @override
  Future<Report?> getById(int id) async {
    return await (db.select(db.reports)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<List<Report>> getByProjectId(int projectId) async {
    return await (db.select(db.reports)..where((tbl) => tbl.proyekId.equals(projectId))).get();
  }

  @override
  Future<int> add(ReportsCompanion item) async {
    return await db.into(db.reports).insert(item);
  }

  @override
  Future<bool> updateItem(int id, ReportsCompanion item) async {
    final result = await (db.update(db.reports)..where((tbl) => tbl.id.equals(id))).write(item);
    return result > 0;
  }

  @override
  Future<bool> deleteItem(int id) async {
    final result = await (db.delete(db.reports)..where((tbl) => tbl.id.equals(id))).go();
    return result > 0;
  }
}
