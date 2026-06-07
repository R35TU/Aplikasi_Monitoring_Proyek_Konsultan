import '../../backend/constants/role_permissions.dart';

// =============================================================
// FILE   : lib/Frontend/utils/permission_checker.dart
// TEKNIK : Table-Driven Construction
// -------------------------------------------------------------
// FUNGSI :
//   Helper untuk mengecek apakah role pengguna memiliki izin
//   melakukan suatu aksi. Menggunakan rolePermissions Map dari
//   role_permissions.dart sebagai tabel rujukan.
// =============================================================

class PermissionChecker {
  static bool canDo(String role, String action) {
    // DEFENSIVE: Guard jika role tidak dikenal
    if (!rolePermissions.containsKey(role)) {
      return false;
    }

    final permissions = rolePermissions[role];
    if (permissions == null) return false;

    return permissions.contains(action);
  }

  static bool canAccessPage(String role, String routePath) {
    if (!rolePermissions.containsKey(role)) {
      return false;
    }

    // Aksi kontrol akses halaman disimulasikan di sini berdasarkan route path
    if (routePath.contains('/admin')) {
      return role == 'super_admin';
    }
    
    if (routePath.contains('/laporan/create')) {
      return canDo(role, 'upload_photo') || role == 'super_admin' || role == 'kontraktor';
    }

    return true; // Halaman umum lainnya bisa diakses oleh semua role yang valid
  }
}
