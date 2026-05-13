// =============================================================
// FILE   : lib/backend/repositories/user_repository.dart
// TEKNIK : Parameterization (via BaseRepository<UserModel>)
//          + Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Implementasi konkret dari BaseRepository<UserModel>.
//   Operasi CRUD tabel 'users' di SQLite.
//
// METHOD YANG DIIMPLEMENTASI :
//   - getAll()               : ambil semua user
//   - getById(int id)        : ambil user berdasarkan ID lokal
//   - getByEmail(String)     : cari user berdasarkan email (TAMBAHAN)
//   - add(UserModel)         : tambah user baru
//   - update(id, model)      : update data user
//   - delete(id)             : hapus user
//
// DEFENSIVE :
//   assert(model.email.contains('@'), 'Email tidak valid')
//   assert(model.name.isNotEmpty, 'Nama tidak boleh kosong')
// =============================================================
