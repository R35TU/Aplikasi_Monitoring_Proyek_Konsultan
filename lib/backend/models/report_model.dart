// =============================================================
// FILE   : lib/backend/models/report_model.dart
// TEKNIK : Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Model domain untuk data laporan harian.
//   Digunakan di provider, UI, dan dikirim ke repository
//   untuk disimpan ke SQLite via Drift.
//
// FIELD :
//   - id        : int
//   - projectId : int     (wajib valid, > 0)
//   - title     : String  (tidak boleh kosong)
//   - progress  : int     (0 - 100)
//   - photoPath : String? (nullable, path foto lapangan)
//   - status    : String  (draft/submitted/approved/rejected)
//   - createdAt : DateTime
//
// DEFENSIVE PROGRAMMING — tambahkan di constructor :
//   assert(title.isNotEmpty, 'Judul laporan tidak boleh kosong')
//   assert(progress >= 0 && progress <= 100, 'Progress harus 0-100')
//   assert(projectId > 0, 'projectId tidak valid')
//   assert(!createdAt.isAfter(DateTime.now()), 'Tanggal tidak valid')
// =============================================================
