// =============================================================
// FILE   : lib/backend/database/tables/tasks_table.dart
// TEKNIK : (fondasi database)
// -------------------------------------------------------------
// FUNGSI :
//   Mendefinisikan skema tabel 'tasks' menggunakan Drift ORM.
//   Menyimpan item-item pekerjaan dalam satu paket proyek.
//   Kolom yang dibutuhkan:
//     - id          : IntColumn, auto-increment primary key
//     - projectId   : IntColumn, foreign key ke tabel projects
//     - description : TextColumn, deskripsi item pekerjaan
//     - volume      : RealColumn, volume pekerjaan
//     - unit         : TextColumn, satuan (m2, m3, unit, dsb.)
//     - isDone      : BoolColumn, apakah item sudah selesai
//
// CATATAN :
//   Setelah mengedit tabel ini, wajib jalankan:
//   dart run build_runner build --delete-conflicting-outputs
// =============================================================
