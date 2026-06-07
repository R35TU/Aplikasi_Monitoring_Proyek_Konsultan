import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../models/report_model.dart';
import 'base_repository.dart';

class ReportRepository extends BaseRepository<ReportModel, int> {
  final AppDatabase db;

  ReportRepository(this.db);

  ReportModel _toModel(Report r) {
    return ReportModel(
      id: r.id,
      projectId: r.proyekId,
      pembuatId: r.pembuatId,
      tipeLaporan: r.tipeLaporan,
      tanggal: r.tanggal,
      deskripsi: r.deskripsi,
      progress: r.progress,
      photoPath: r.fotoUrl,
      geotagLokasi: r.geotagLokasi,
      fotoSelfieUrl: r.fotoSelfieUrl,
      status: r.status,
      catatanRevisi: r.catatanRevisi,
    );
  }

  @override
  Future<List<ReportModel>> getAll() async {
    final reports = await db.select(db.reports).get();
    return reports.map(_toModel).toList();
  }

  @override
  Future<ReportModel?> getById(int id) async {
    final query = db.select(db.reports)..where((t) => t.id.equals(id));
    final report = await query.getSingleOrNull();
    if (report == null) return null;
    return _toModel(report);
  }

  Future<List<ReportModel>> getByProjectId(int projectId) async {
    final query = db.select(db.reports)..where((t) => t.proyekId.equals(projectId));
    final reports = await query.get();
    return reports.map(_toModel).toList();
  }

  Future<List<ReportModel>> getByStatus(String status) async {
    final query = db.select(db.reports)..where((t) => t.status.equals(status));
    final reports = await query.get();
    return reports.map(_toModel).toList();
  }

  Future<bool> updateStatus(int id, String newStatus, {String? catatan}) async {
    final count = await (db.update(db.reports)..where((t) => t.id.equals(id))).write(
      ReportsCompanion(
        status: Value(newStatus),
        catatanRevisi: Value(catatan),
      ),
    );
    return count > 0;
  }

  @override
  Future<int> add(ReportModel item) async {
    assert(item.progress >= 0 && item.progress <= 100, 'Progress harus 0-100');
    assert(item.projectId > 0, 'projectId tidak valid');

    final id = await db.into(db.reports).insert(
          ReportsCompanion.insert(
            proyekId: item.projectId,
            pembuatId: Value(item.pembuatId),
            tipeLaporan: Value(item.tipeLaporan),
            tanggal: item.tanggal,
            deskripsi: Value(item.deskripsi),
            fotoUrl: Value(item.photoPath),
            geotagLokasi: Value(item.geotagLokasi),
            fotoSelfieUrl: Value(item.fotoSelfieUrl),
            progress: Value(item.progress),
            status: Value(item.status),
            catatanRevisi: Value(item.catatanRevisi),
          ),
        );
    return id;
  }

  @override
  Future<bool> update(int id, ReportModel item) async {
    assert(item.progress >= 0 && item.progress <= 100, 'Progress harus 0-100');
    assert(item.projectId > 0, 'projectId tidak valid');

    final count = await (db.update(db.reports)..where((t) => t.id.equals(id))).write(
      ReportsCompanion(
        proyekId: Value(item.projectId),
        pembuatId: Value(item.pembuatId),
        tipeLaporan: Value(item.tipeLaporan),
        tanggal: Value(item.tanggal),
        deskripsi: Value(item.deskripsi),
        fotoUrl: Value(item.photoPath),
        geotagLokasi: Value(item.geotagLokasi),
        fotoSelfieUrl: Value(item.fotoSelfieUrl),
        progress: Value(item.progress),
        status: Value(item.status),
        catatanRevisi: Value(item.catatanRevisi),
      ),
    );
    return count > 0;
  }

  @override
  Future<bool> delete(int id) async {
    final count = await (db.delete(db.reports)..where((t) => t.id.equals(id))).go();
    return count > 0;
  }
}
