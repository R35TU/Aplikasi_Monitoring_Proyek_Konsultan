// =============================================================
// FILE   : lib/Frontend/utils/permission_checker.dart
// TEKNIK : Table-Driven Construction
// -------------------------------------------------------------
// FUNGSI :
//   Helper untuk mengecek apakah role pengguna memiliki izin
//   melakukan suatu aksi. Menggunakan rolePermissions Map dari
//   role_permissions.dart sebagai tabel rujukan.
//
// FUNGSI YANG PERLU DIBUAT :
//   static bool canDo(String role, String action)
//     → cek apakah role bisa melakukan action
//     → contoh: canDo('kontraktor', 'delete') → false
//
//   static bool canAccessPage(String role, String routePath)
//     → cek apakah role boleh akses halaman tertentu
//     → dipakai di app_router.dart untuk redirect guard
//
// CARA PAKAI :
//   if (PermissionChecker.canDo(currentUser.role, 'write')) {
//     // tampilkan tombol tambah laporan
//   }
//
// DEFENSIVE :
//   Guard jika role tidak dikenal:
//   if (!rolePermissions.containsKey(role)) return false;
// =============================================================
