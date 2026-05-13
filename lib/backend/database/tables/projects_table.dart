// =============================================================
// FILE   : lib/backend/database/tables/projects_table.dart
// TEKNIK : (fondasi database, dipakai oleh Parameterization di repo)
// -------------------------------------------------------------
// FUNGSI :
//   Mendefinisikan skema tabel 'projects' menggunakan Drift ORM.
//   Kolom yang dibutuhkan:
//     - id        : IntColumn, auto-increment primary key
//     - name      : TextColumn, nama paket proyek
//     - location  : TextColumn, lokasi proyek
//     - startDate : DateTimeColumn, tanggal mulai
//     - endDate   : DateTimeColumn, tanggal selesai (target)
//     - progress  : RealColumn, persentase kemajuan 0.0 - 100.0
//     - status    : TextColumn, nilai: aktif / selesai / pending
//
// CATATAN :
//   Setelah mengedit tabel ini, wajib jalankan:
//   dart run build_runner build --delete-conflicting-outputs
// =============================================================
