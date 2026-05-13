// =============================================================
// FILE   : lib/backend/database/tables/users_table.dart
// TEKNIK : (fondasi database, dipakai oleh Parameterization di repo)
// -------------------------------------------------------------
// FUNGSI :
//   Mendefinisikan skema tabel 'users' menggunakan Drift ORM.
//   Kolom yang dibutuhkan:
//     - id        : IntColumn, auto-increment primary key
//     - name      : TextColumn, nama lengkap pengguna
//     - email     : TextColumn, email unik pengguna
//     - role      : TextColumn, nilai: super_admin / admin_lapangan /
//                   kontraktor / client / aph
//     - createdAt : DateTimeColumn, waktu akun dibuat
//
// CARA PAKAI :
//   Class ini di-include ke app_database.dart sebagai bagian dari
//   @DriftDatabase(tables: [Users, Projects, Reports, Tasks])
//
// CATATAN :
//   Setelah mengedit tabel ini, wajib jalankan:
//   dart run build_runner build --delete-conflicting-outputs
// =============================================================
