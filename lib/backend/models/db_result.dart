// =============================================================
// FILE   : lib/backend/models/db_result.dart
// TEKNIK : Parameterization / Generics
// -------------------------------------------------------------
// FUNGSI :
//   Wrapper generic DbResult<T> untuk membungkus hasil operasi
//   database (sukses atau gagal) tanpa throw exception langsung ke UI.
//
// STRUKTUR :
//   class DbResult<T> {
//     final T? data;
//     final String? errorMessage;
//     final bool isSuccess;
//
//     DbResult.success({required T data}) ...
//     DbResult.failure({required String message}) ...
//   }
//
// CARA PAKAI :
//   // Di repository:
//   return DbResult.success(data: listProyek);
//   return DbResult.failure(message: 'Data tidak ditemukan');
//
//   // Di provider / UI:
//   if (result.isSuccess) { gunakan result.data }
//   else { tampilkan result.errorMessage }
//
// CATATAN GENERICS :
//   Dengan <T>, satu class ini bisa dipakai untuk semua tipe:
//   DbResult<List<ProjectModel>>, DbResult<ReportModel>, dst.
// =============================================================
