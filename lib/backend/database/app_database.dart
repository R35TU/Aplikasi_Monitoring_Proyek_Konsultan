// =============================================================
// FILE   : lib/backend/database/app_database.dart
// TEKNIK : (fondasi database — dipakai oleh semua repository)
// -------------------------------------------------------------
// FUNGSI :
//   Titik pusat koneksi SQLite menggunakan Drift ORM.
//   Mendaftarkan semua tabel (Users, Projects, Reports, Tasks)
//   ke dalam satu database class dengan @DriftDatabase annotation.
//   File .g.dart akan di-generate otomatis oleh build_runner.
//
// CARA PAKAI :
//   final db = AppDatabase();
//   // lalu inject ke repository via constructor
//
// PENTING :
//   Untuk Flutter Web (PWA), gunakan WasmDatabase.open() agar
//   bisa jalan di browser.
//   Untuk testing, gunakan NativeDatabase.memory().
//
// SETELAH DIEDIT :
//   dart run build_runner build --delete-conflicting-outputs
// =============================================================
