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

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  // Field statis privat untuk menyimpan status inisialisasi
  static bool _isInitialized = false;

  // Mendapatkan nama database SQLite
  static String get dbName {
    _ensureInitialized();
    return _getRequired('DB_NAME');
  }

  // Mendapatkan status mode debug
  static bool get isDebug {
    _ensureInitialized();
    final debugVal = _getRequired('DEBUG').toLowerCase();
    if (debugVal == 'true') {
      return true;
    } else if (debugVal == 'false') {
      return false;
    } else {
      throw Exception(
        'CONFIG ERROR: Nilai untuk konfigurasi "DEBUG" harus berupa boolean ("true" atau "false"), sedangkan nilai saat ini adalah "$debugVal".'
      );
    }
  }

  // Mendapatkan base URL API backend
  static String get baseUrl {
    _ensureInitialized();
    return _getRequired('BASE_URL');
  }

  // Inisialisasi konfigurasi env
  // isProduction menentukan file mana yang akan di-load (.env.production / .env.development)
  static Future<void> initialize({required bool isProduction}) async {
    final envFile = isProduction ? '.env.production' : '.env.development';
    
    try {
      await dotenv.load(fileName: envFile);
      _isInitialized = true;

      // Defensive Programming (Precondition/Invariant Check): 
      // Segera validasi keberadaan semua konfigurasi wajib saat inisialisasi.
      // Jika ada yang kosong, langsung lempar Exception agar crash di awal (fail-fast).
      dbName;
      isDebug;
      baseUrl;
    } catch (e) {
      _isInitialized = false;
      throw Exception(
        'CONFIG ERROR: Gagal melakukan inisialisasi konfigurasi menggunakan file "$envFile". Detail: $e'
      );
    }
  }

  // Defensive Check: Memastikan inisialisasi telah dilakukan sebelum nilai konfigurasi diakses
  static void _ensureInitialized() {
    if (!_isInitialized) {
      throw Exception(
        'CONFIG ERROR: AppConfig belum diinisialisasi! Panggil AppConfig.initialize() terlebih dahulu di main.dart.'
      );
    }
  }

  // Defensive Check: Mengambil nilai dan memastikan nilainya tidak null/kosong
  static String _getRequired(String key) {
    final value = dotenv.maybeGet(key);
    if (value == null || value.trim().isEmpty) {
      throw Exception(
        'CONFIG ERROR: Variabel environment wajib "$key" tidak ditemukan atau bernilai kosong di file .env!'
      );
    }
    return value;
  }
}
