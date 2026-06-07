// =============================================================
// FILE   : lib/backend/models/project_model.dart
// TEKNIK : Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Model domain untuk data paket proyek.
//   Plain Dart class yang dipakai di layer provider dan UI.
// =============================================================

class ProjectModel {
  final int? id;
  final String title;
  final String location;
  final String status; // 'Progres', 'Selesai', 'Dibatalkan'
  final double targetProgress;
  final double actualProgress;
  final String imagePath;

  ProjectModel({
    this.id,
    required this.title,
    required this.location,
    required this.status,
    required this.targetProgress,
    required this.actualProgress,
    required this.imagePath,
  });
}
