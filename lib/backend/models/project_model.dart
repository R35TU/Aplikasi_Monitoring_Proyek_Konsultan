
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
  final String? deskripsi;

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
    this.deskripsi,
  });

  // --- GETTER (Tetap ada agar UI bisa baca variabel lama) ---
  String get title => namaProyek;
  String get location => lokasi;
  String get imagePath => (gambarUrl == null || gambarUrl!.isEmpty) ? 'assets/images/bottom_bg.png' : gambarUrl!;
  double get targetProgress => progressRencana / 100;
  double get actualProgress => progressAktual / 100;

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['project_id'] as int? ?? json['id'] as int? ?? 0,
      namaProyek: json['nama_proyek'] as String? ?? 'Tanpa Nama',
      perusahaanId: json['perusahaan_id'] as int? ?? 0,
      pemilikProyek: json['pemilik_proyek'] as String?,
      sumberDana: json['sumber_dana'] as String?,
      lokasi: json['lokasi'] as String? ?? 'Tidak diketahui',
      gambarUrl: json['gambar_url'] as String?,
      tanggalMulai: json['tanggal_mulai'] as String? ?? '',
      targetSelesai: json['target_selesai'] as String? ?? '',
      progressRencana: json['progress_rencana'] as int? ?? 0,
      progressAktual: json['progress_aktual'] as int? ?? 0,
      status: json['status'] as String? ?? 'Perencanaan',
      deskripsi: json['deskripsi'] as String?,
    );
  }

}
