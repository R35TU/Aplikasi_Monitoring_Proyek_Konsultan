class ActivityHistoryModel {
  final int? id;
  final String? userId;
  final String action;
  final String entityType;
  final String entityId;
  final String description;
  final DateTime timestamp;

  ActivityHistoryModel({
    this.id,
    this.userId,
    required this.action,
    required this.entityType,
    required this.entityId,
    required this.description,
    required this.timestamp,
  });
}
