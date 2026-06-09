
class ProjectModel {
  final int id;
  final String namaProyek;
  final int perusahaanId;
  final String? pemilikProyek;
  final String? sumberDana;
  final String lokasi;
  final String? gambarUrl;
  final String tanggalMulai;
  final String targetSelesai;
  final int progressRencana;
  final int progressAktual;
  final String status;

  ProjectModel({
    required this.id,
    required this.namaProyek,
    required this.perusahaanId,
    this.pemilikProyek,
    this.sumberDana,
    required this.lokasi,
    this.gambarUrl,
    required this.tanggalMulai,
    required this.targetSelesai,
    required this.progressRencana,
    required this.progressAktual,
    required this.status,
  });

  // --- JEMBATAN UNTUK DATA DUMMY (Biar UI Nadia gak error) ---
  factory ProjectModel.dummy({
    required String title,
    required String location,
    required String status,
    required double targetProgress,
    required double actualProgress,
    required String imagePath,
  }) {
    return ProjectModel(
      id: 0, // ID dummy
      namaProyek: title,
      perusahaanId: 1, // ID dummy
      lokasi: location,
      gambarUrl: imagePath,
      tanggalMulai: '2025-01-01',
      targetSelesai: '2025-12-31',
      progressRencana: (targetProgress * 100).toInt(),
      progressAktual: (actualProgress * 100).toInt(),
      status: status,
    );
  }

  // --- GETTER (Tetap ada agar UI bisa baca variabel lama) ---
  String get title => namaProyek;
  String get location => lokasi;
  String get imagePath => gambarUrl ?? 'assets/images/bottom_bg.png';
  double get targetProgress => progressRencana / 100;
  double get actualProgress => progressAktual / 100;

}
