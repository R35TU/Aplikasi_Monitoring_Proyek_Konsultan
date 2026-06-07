import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../models/task_model.dart';
import 'base_repository.dart';

class TaskRepository extends BaseRepository<TaskModel, int> {
  final AppDatabase db;

  TaskRepository(this.db);

  TaskModel _toModel(Task t) {
    return TaskModel(
      id: t.id,
      reportId: t.reportId,
      namaPekerjaan: t.namaPekerjaan,
      volumeTarget: t.volumeTarget,
      volumeRealisasi: t.volumeRealisasi,
      satuan: t.satuan,
      isSelesai: t.isSelesai,
    );
  }

  @override
  Future<List<TaskModel>> getAll() async {
    final tasks = await db.select(db.tasks).get();
    return tasks.map(_toModel).toList();
  }

  @override
  Future<TaskModel?> getById(int id) async {
    final query = db.select(db.tasks)..where((t) => t.id.equals(id));
    final task = await query.getSingleOrNull();
    if (task == null) return null;
    return _toModel(task);
  }

  Future<List<TaskModel>> getByReportId(int reportId) async {
    final query = db.select(db.tasks)..where((t) => t.reportId.equals(reportId));
    final tasks = await query.get();
    return tasks.map(_toModel).toList();
  }

  @override
  Future<int> add(TaskModel item) async {
    assert(item.namaPekerjaan.isNotEmpty, 'Nama pekerjaan tidak boleh kosong');

    final id = await db.into(db.tasks).insert(
          TasksCompanion.insert(
            reportId: item.reportId,
            namaPekerjaan: item.namaPekerjaan,
            volumeTarget: Value(item.volumeTarget),
            volumeRealisasi: Value(item.volumeRealisasi),
            satuan: Value(item.satuan),
            isSelesai: Value(item.isSelesai),
          ),
        );
    return id;
  }

  @override
  Future<bool> update(int id, TaskModel item) async {
    assert(item.namaPekerjaan.isNotEmpty, 'Nama pekerjaan tidak boleh kosong');

    final count = await (db.update(db.tasks)..where((t) => t.id.equals(id))).write(
      TasksCompanion(
        reportId: Value(item.reportId),
        namaPekerjaan: Value(item.namaPekerjaan),
        volumeTarget: Value(item.volumeTarget),
        volumeRealisasi: Value(item.volumeRealisasi),
        satuan: Value(item.satuan),
        isSelesai: Value(item.isSelesai),
      ),
    );
    return count > 0;
  }

  @override
  Future<bool> delete(int id) async {
    final count = await (db.delete(db.tasks)..where((t) => t.id.equals(id))).go();
    return count > 0;
  }
}
