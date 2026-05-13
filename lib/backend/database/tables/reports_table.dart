// =============================================================
// FILE   : lib/backend/database/tables/reports_table.dart
// TEKNIK : (fondasi database, dipakai oleh Automata di report_provider)
// -------------------------------------------------------------
// FUNGSI :
//   Mendefinisikan skema tabel 'reports' menggunakan Drift ORM.
//   Menyimpan laporan harian yang diinput dari lapangan.
//   Kolom yang dibutuhkan:
//     - id        : IntColumn, auto-increment primary key
//     - projectId : IntColumn, foreign key ke tabel projects
//     - title     : TextColumn, judul / deskripsi laporan
//     - progress  : IntColumn, kemajuan harian (0-100)
//     - photoPath : TextColumn nullable, path foto bukti lapangan
//     - status    : TextColumn, nilai: draft/submitted/approved/rejected
//     - createdAt : DateTimeColumn, waktu laporan dibuat
//
// RELASI :
//   Satu project bisa punya banyak report (one-to-many).
//
// CATATAN :
//   Field 'status' adalah state dari FSM di report_provider.dart.
//   Setelah mengedit tabel ini, wajib jalankan:
//   dart run build_runner build --delete-conflicting-outputs
// =============================================================
