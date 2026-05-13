// =============================================================
// FILE   : lib/backend/models/user_model.dart
// TEKNIK : Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Model domain untuk data pengguna aplikasi.
//   Menyimpan informasi akun dan role yang menentukan hak akses
//   (dipakai bersama role_permissions.dart).
//
// FIELD :
//   - id        : int
//   - name      : String  (tidak boleh kosong)
//   - email     : String  (harus mengandung '@')
//   - role      : String  (harus salah satu role yang valid)
//   - createdAt : DateTime
//
// DEFENSIVE PROGRAMMING — tambahkan di constructor :
//   final validRoles = ['super_admin','admin_lapangan','kontraktor','client','aph'];
//   assert(name.isNotEmpty, 'Nama tidak boleh kosong')
//   assert(email.contains('@'), 'Format email tidak valid')
//   assert(validRoles.contains(role), 'Role tidak dikenal: $role')
// =============================================================
