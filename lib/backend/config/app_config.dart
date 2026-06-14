import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  /// Mengambil URL Supabase dari file .env
  static String get supabaseUrl {
    final url = dotenv.env['SUPABASE_URL'];
    if (url == null || url.isEmpty) {
      throw Exception('Konfigurasi SUPABASE_URL tidak ditemukan di environment file.');
    }
    return url;
  }

  /// Mengambil Anon Key Supabase dari file .env
  static String get supabaseAnonKey {
    final key = dotenv.env['SUPABASE_ANON_KEY'];
    if (key == null || key.isEmpty) {
      throw Exception('Konfigurasi SUPABASE_ANON_KEY tidak ditemukan di environment file.');
    }
    return key;
  }

  /// Cek apakah mode debug aktif (contoh tambahan jika diperlukan)
  static bool get isDebug {
    return dotenv.env['DEBUG'] == 'true';
  }
}
