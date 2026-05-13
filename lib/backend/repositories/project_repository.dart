// =============================================================
// FILE   : lib/backend/repositories/project_repository.dart
// TEKNIK : Parameterization (via BaseRepository<ProjectModel>)
//          + Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Implementasi konkret dari BaseRepository<ProjectModel>.
//   Operasi CRUD tabel 'projects' di SQLite menggunakan Drift.
//
// METHOD YANG DIIMPLEMENTASI :
//   - getAll()            : ambil semua proyek
//   - getById(int id)     : ambil proyek berdasarkan ID
//   - add(ProjectModel)   : tambah proyek baru, return id
//   - update(id, model)   : update data proyek, return bool
//   - delete(id)          : hapus proyek, return bool
//
// METHOD TAMBAHAN (opsional) :
//   - getByStatus(String status) : filter proyek by status
//
// DEFENSIVE :
//   Precondition sebelum insert/update:
//   assert(model.name.isNotEmpty, 'Nama proyek tidak boleh kosong')
// =============================================================
