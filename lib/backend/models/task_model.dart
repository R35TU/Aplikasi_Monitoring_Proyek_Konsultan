class TaskModel {
  final int? id;
  final int reportId;
  final String namaPekerjaan;
  final double? volumeTarget;
  final double? volumeRealisasi;
  final String? satuan;
  final bool isSelesai;

  TaskModel({
    this.id,
    required this.reportId,
    required this.namaPekerjaan,
    this.volumeTarget,
    this.volumeRealisasi,
    this.satuan,
    required this.isSelesai,
  });
}
