// =============================================================
// FILE   : lib/backend/models/project_model.dart
// TEKNIK : Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Model domain untuk data paket proyek.
//   Plain Dart class yang dipakai di layer provider dan UI.
//   Di-convert dari/ke Drift CompanionData di repository.
//
// FIELD :
//   - id        : int
//   - name      : String  (tidak boleh kosong)
//   - location  : String
//   - startDate : DateTime
//   - endDate   : DateTime (harus setelah startDate)
//   - progress  : double  (0.0 - 100.0)
//   - status    : String
//
// DEFENSIVE PROGRAMMING — tambahkan di constructor :
//   assert(name.isNotEmpty, 'Nama proyek tidak boleh kosong')
//   assert(progress >= 0 && progress <= 100, 'Progress harus 0-100')
//   assert(endDate.isAfter(startDate), 'endDate harus setelah startDate')
// =============================================================
