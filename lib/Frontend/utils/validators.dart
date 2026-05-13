// =============================================================
// FILE   : lib/Frontend/utils/validators.dart
// TEKNIK : Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Kumpulan fungsi validasi input form yang digunakan di
//   berbagai screen (report_form, login, user_management).
//   Memastikan data yang masuk ke backend selalu valid.
//
// FUNGSI YANG PERLU DIBUAT :
//   static String? validateTitle(String? value)
//     → null jika valid, pesan error jika tidak
//   static String? validateEmail(String? value)
//     → cek format mengandung '@' dan domain
//   static String? validateProgress(String? value)
//     → cek angka antara 0-100
//   static String? validatePassword(String? value)
//     → minimal 6 karakter
//   static String? validateNotEmpty(String? value, String fieldName)
//     → generic validator untuk field wajib isi
//
// CARA PAKAI :
//   Di TextFormField: validator: Validators.validateTitle
//
// CATATAN :
//   Return null  = valid (tidak ada error).
//   Return String = pesan error yang muncul di bawah field.
// =============================================================
