import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../models/project_model.dart';
import 'base_repository.dart';

class ProjectRepository extends BaseRepository<ProjectModel, int> {
  final AppDatabase db;

  ProjectRepository(this.db);

  ProjectModel _toModel(Project p) {
    return ProjectModel(
      id: p.id,
      title: p.namaProyek,
      location: p.lokasi ?? '',
      kategori: p.kategori ?? '',
      tanggalMulai: p.tanggalMulai,
      tanggalSelesai: p.tanggalSelesai,
      nilaiKontrak: p.nilaiKontrak,
      kontraktorId: p.kontraktorId,
      dinasId: p.dinasId,
      status: p.status,
      targetProgress: p.targetProgress,
      actualProgress: p.actualProgress,
      imagePath: p.imagePath ?? '',
      deskripsi: p.deskripsi,
      sumberDana: p.sumberDana,
      namaPemilik: p.namaPemilik,
    );
  }

  @override
  Future<List<ProjectModel>> getAll() async {
    final projects = await db.select(db.projects).get();
    return projects.map(_toModel).toList();
  }

  @override
  Future<ProjectModel?> getById(int id) async {
    final query = db.select(db.projects)..where((t) => t.id.equals(id));
    final project = await query.getSingleOrNull();
    if (project == null) return null;
    return _toModel(project);
  }

  Future<List<ProjectModel>> getByStatus(String status) async {
    final query = db.select(db.projects)..where((t) => t.status.equals(status));
    final projects = await query.get();
    return projects.map(_toModel).toList();
  }

  Future<List<ProjectModel>> searchByName(String queryStr) async {
    final query = db.select(db.projects)
      ..where((t) => t.namaProyek.like('%$queryStr%'));
    final projects = await query.get();
    return projects.map(_toModel).toList();
  }

  @override
  Future<int> add(ProjectModel item) async {
    assert(item.title.isNotEmpty, 'Nama proyek tidak boleh kosong');

    final id = await db.into(db.projects).insert(
          ProjectsCompanion.insert(
            namaProyek: item.title,
            lokasi: Value(item.location),
            kategori: Value(item.kategori),
            tanggalMulai: Value(item.tanggalMulai),
            tanggalSelesai: Value(item.tanggalSelesai),
            nilaiKontrak: Value(item.nilaiKontrak),
            kontraktorId: Value(item.kontraktorId),
            dinasId: Value(item.dinasId),
            status: Value(item.status),
            targetProgress: Value(item.targetProgress),
            actualProgress: Value(item.actualProgress),
            imagePath: Value(item.imagePath),
            deskripsi: Value(item.deskripsi),
            sumberDana: Value(item.sumberDana),
            namaPemilik: Value(item.namaPemilik),
          ),
        );
    return id;
  }

  @override
  Future<bool> update(int id, ProjectModel item) async {
    assert(item.title.isNotEmpty, 'Nama proyek tidak boleh kosong');

    final count = await (db.update(db.projects)..where((t) => t.id.equals(id)))
        .write(
      ProjectsCompanion(
        namaProyek: Value(item.title),
        lokasi: Value(item.location),
        kategori: Value(item.kategori),
        tanggalMulai: Value(item.tanggalMulai),
        tanggalSelesai: Value(item.tanggalSelesai),
        nilaiKontrak: Value(item.nilaiKontrak),
        kontraktorId: Value(item.kontraktorId),
        dinasId: Value(item.dinasId),
        status: Value(item.status),
        targetProgress: Value(item.targetProgress),
        actualProgress: Value(item.actualProgress),
        imagePath: Value(item.imagePath),
        deskripsi: Value(item.deskripsi),
        sumberDana: Value(item.sumberDana),
        namaPemilik: Value(item.namaPemilik),
      ),
    );
    return count > 0;
  }

  @override
  Future<bool> delete(int id) async {
    final count = await (db.delete(db.projects)..where((t) => t.id.equals(id)))
        .go();
    return count > 0;
  }
}
