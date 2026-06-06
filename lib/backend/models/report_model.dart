// =============================================================
// FILE   : lib/backend/models/report_model.dart
// TEKNIK : Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Model domain untuk data laporan harian.
//   Digunakan di provider, UI, dan dikirim ke repository
//   untuk disimpan ke SQLite via Drift.
//
// FIELD :
//   - id            : int?
//   - projectId     : int     (wajib valid, > 0)
//   - pembuatId     : String? 
//   - tipeLaporan   : String  (volume_kontraktor, mutu_konsultan)
//   - tanggal       : String
//   - deskripsi     : String?
//   - progress      : int     (0 - 100)
//   - photoPath     : String? (nullable, path foto lapangan)
//   - geotagLokasi  : String? (Koordinat GPS)
//   - fotoSelfieUrl : String? (Bukti kehadiran)
//   - status        : String  (draft/submitted/approved/rejected)
//   - catatanRevisi : String?
//
// DEFENSIVE PROGRAMMING — tambahkan di constructor :
//   assert(progress >= 0 && progress <= 100, 'Progress harus 0-100')
//   assert(projectId > 0, 'projectId tidak valid')
// =============================================================

class ReportModel {
  final int? id;
  final int projectId;
  final String? pembuatId;
  final String tipeLaporan;
  final String tanggal;
  final String? deskripsi;
  final int progress;
  final String? photoPath;
  final String? geotagLokasi;
  final String? fotoSelfieUrl;
  final String status;
  final String? catatanRevisi;

  ReportModel({
    this.id,
    required this.projectId,
    this.pembuatId,
    required this.tipeLaporan,
    required this.tanggal,
    this.deskripsi,
    required this.progress,
    this.photoPath,
    this.geotagLokasi,
    this.fotoSelfieUrl,
    required this.status,
    this.catatanRevisi,
  }) {
    assert(progress >= 0 && progress <= 100, 'Progress harus 0-100');
    assert(projectId > 0, 'projectId tidak valid');
  }
}
