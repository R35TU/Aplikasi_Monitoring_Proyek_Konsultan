// =============================================================
// FILE   : lib/backend/constants/role_permissions.dart
// TEKNIK : Table-Driven Construction
// -------------------------------------------------------------
// FUNGSI :
//   Mendefinisikan tabel permission berbasis Map<String, List<String>>.
//   Setiap role (super_admin, admin_lapangan, kontraktor, client, aph)
//   dipetakan ke daftar aksi yang diizinkan.
//   Digunakan oleh permission_checker.dart untuk validasi hak akses.
// =============================================================

const Map<String, List<String>> rolePermissions = {
  'super_admin': ['read', 'write', 'delete', 'validate', 'grant_access'],
  'admin_lapangan': ['read', 'write', 'upload_photo'],
  'kontraktor': ['read', 'write'], // Kontraktor bisa menulis laporan draft
  'client': ['read'],
  'aph': ['read'], // Audit hukum
};
