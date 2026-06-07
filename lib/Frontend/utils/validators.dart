// =============================================================
// FILE   : lib/Frontend/utils/validators.dart
// TEKNIK : Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Kumpulan fungsi validasi input form yang digunakan di
//   berbagai screen (report_form, login, user_management).
//   Memastikan data yang masuk ke backend selalu valid.
// =============================================================

class Validators {
  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Judul tidak boleh kosong';
    }
    if (value.length < 3) {
      return 'Judul minimal 3 karakter';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return 'Format email tidak valid (harus mengandung @ dan .)';
    }
    return null;
  }

  static String? validateProgress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Progress tidak boleh kosong';
    }
    final parsed = int.tryParse(value);
    if (parsed == null) {
      return 'Progress harus berupa angka';
    }
    if (parsed < 0 || parsed > 100) {
      return 'Progress harus bernilai antara 0 - 100';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  static String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName tidak boleh kosong';
    }
    return null;
  }
}
