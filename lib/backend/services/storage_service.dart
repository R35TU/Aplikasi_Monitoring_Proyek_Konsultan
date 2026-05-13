// =============================================================
// FILE   : lib/backend/services/storage_service.dart
// TEKNIK : API
// -------------------------------------------------------------
// FUNGSI :
//   Upload dan download foto dokumentasi lapangan
//   menggunakan Firebase Storage SDK.
//
// METHOD YANG PERLU DIBUAT :
//   - uploadPhoto(File file, String path) : upload foto, return URL
//   - deletePhoto(String url)             : hapus foto dari Storage
//   - getPhotoUrl(String path)            : ambil URL foto
//
// ALUR UPLOAD :
//   1. User pilih foto via image_picker (di photo_upload_widget)
//   2. File dikirim ke uploadPhoto()
//   3. URL hasil upload disimpan ke ReportModel.photoPath
//   4. ReportModel disimpan ke SQLite via report_repository
//
// DEFENSIVE :
//   Validasi file tidak null dan ukuran < 5MB sebelum upload.
//   Wrap upload dengan try-catch FirebaseException.
// =============================================================
