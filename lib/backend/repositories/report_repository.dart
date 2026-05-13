// =============================================================
// FILE   : lib/backend/repositories/report_repository.dart
// TEKNIK : Parameterization (via BaseRepository<ReportModel>)
//          + Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Implementasi konkret dari BaseRepository<ReportModel>.
//   Repository yang paling sering diakses karena laporan harian
//   diinput setiap hari dari lapangan.
//
// METHOD YANG DIIMPLEMENTASI :
//   - getAll()                  : ambil semua laporan
//   - getById(int id)           : ambil laporan berdasarkan ID
//   - getByProjectId(int id)    : ambil laporan per proyek (PENTING)
//   - add(ReportModel)          : simpan laporan baru, return id
//   - update(id, model)         : update laporan, return bool
//   - delete(id)                : hapus laporan, return bool
//
// DIPAKAI OLEH :
//   report_provider.dart (FSM Automata) untuk update status laporan.
//
// DEFENSIVE :
//   assert(model.title.isNotEmpty, 'Judul tidak boleh kosong')
//   assert(model.progress >= 0 && model.progress <= 100)
// =============================================================
