import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../models/activity_history_model.dart';
import 'base_repository.dart';

class ActivityHistoryRepository extends BaseRepository<ActivityHistoryModel, int> {
  final AppDatabase db;

  ActivityHistoryRepository(this.db);

  ActivityHistoryModel _toModel(ActivityHistory h) {
    return ActivityHistoryModel(
      id: h.id,
      userId: h.userId,
      action: h.action,
      entityType: h.entityType,
      entityId: h.entityId,
      description: h.description,
      timestamp: DateTime.tryParse(h.timestamp) ?? DateTime.now(),
    );
  }

  @override
  Future<List<ActivityHistoryModel>> getAll() async {
    final histories = await db.select(db.activityHistories).get();
    return histories.map(_toModel).toList();
  }

  @override
  Future<ActivityHistoryModel?> getById(int id) async {
    final query = db.select(db.activityHistories)..where((t) => t.id.equals(id));
    final history = await query.getSingleOrNull();
    if (history == null) return null;
    return _toModel(history);
  }

  Future<List<ActivityHistoryModel>> getByUserId(String userId) async {
    final query = db.select(db.activityHistories)..where((t) => t.userId.equals(userId));
    final histories = await query.get();
    return histories.map(_toModel).toList();
  }

  @override
  Future<int> add(ActivityHistoryModel item) async {
    final id = await db.into(db.activityHistories).insert(
          ActivityHistoriesCompanion.insert(
            userId: Value(item.userId),
            action: item.action,
            entityType: item.entityType,
            entityId: item.entityId,
            description: item.description,
            timestamp: item.timestamp.toIso8601String(),
          ),
        );
    return id;
  }

  @override
  Future<bool> update(int id, ActivityHistoryModel item) async {
    final count = await (db.update(db.activityHistories)..where((t) => t.id.equals(id))).write(
      ActivityHistoriesCompanion(
        userId: Value(item.userId),
        action: Value(item.action),
        entityType: Value(item.entityType),
        entityId: Value(item.entityId),
        description: Value(item.description),
        timestamp: Value(item.timestamp.toIso8601String()),
      ),
    );
    return count > 0;
  }

  @override
  Future<bool> delete(int id) async {
    final count = await (db.delete(db.activityHistories)..where((t) => t.id.equals(id))).go();
    return count > 0;
  }
}
