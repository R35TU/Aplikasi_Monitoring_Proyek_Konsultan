// =============================================================
// FILE   : lib/backend/config/app_config.dart
// TEKNIK : Runtime Configuration
// -------------------------------------------------------------
// FUNGSI :
//   Membaca variabel environment dari file .env.development
//   atau .env.production saat aplikasi pertama kali dijalankan.
//   Menyediakan nilai konfigurasi seperti nama database, base URL,
//   dan mode debug kepada seluruh bagian aplikasi.
//
// CARA PAKAI :
//   1. Tambahkan package flutter_dotenv di pubspec.yaml
//   2. Load file .env di main.dart sebelum runApp()
//   3. Akses nilai via AppConfig.dbName, AppConfig.isDebug, dst.
//
// CONTOH ISI .env :
//   DB_NAME=tata_saka.db
//   DEBUG=true
//
// CATATAN DEFENSIVE :
//   Validasi bahwa variabel wajib tidak kosong saat load.
//   Lempar Exception jika konfigurasi kritis tidak ditemukan.
// =============================================================
