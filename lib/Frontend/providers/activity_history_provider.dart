import 'package:flutter/material.dart';
import '../../backend/models/activity_history_model.dart';
import '../../backend/repositories/activity_history_repository.dart';

class ActivityHistoryProvider extends ChangeNotifier {
  final ActivityHistoryRepository activityHistoryRepository;

  List<ActivityHistoryModel> _histories = [];
  bool _isLoading = false;

  ActivityHistoryProvider(this.activityHistoryRepository);

  List<ActivityHistoryModel> get histories => _histories;
  bool get isLoading => _isLoading;

  Future<void> loadHistories() async {
    _isLoading = true;
    notifyListeners();
    try {
      _histories = await activityHistoryRepository.getAll();
    } catch (e) {
      debugPrint('ActivityHistoryProvider error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logActivity(String userId, String action, String entityType, String entityId, String description) async {
    final history = ActivityHistoryModel(
      userId: userId,
      action: action,
      entityType: entityType,
      entityId: entityId,
      description: description,
      timestamp: DateTime.now(),
    );
    await activityHistoryRepository.add(history);
    await loadHistories();
  }
}
