// =============================================================
// FILE   : lib/Frontend/providers/report_provider.dart
// TEKNIK : Automata (Finite State Machine) + Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Mengelola state workflow laporan harian menggunakan FSM.
//   Mengatur transisi status laporan dari draft sampai selesai.
//
// STATE (ReportState enum) :
//   draft → submitted → approved
//                   ↘→ rejected → draft (revisi)
//
// TRANSISI YANG VALID :
//   submit()  : draft     → submitted
//   approve() : submitted → approved
//   reject()  : submitted → rejected
//   revise()  : rejected  → draft
//
// DEFENSIVE :
//   assert(state == ReportState.draft, 'submit() hanya dari DRAFT')
//   assert(state == ReportState.submitted, 'approve() hanya dari SUBMITTED')
//
// INTEGRASI :
//   Setelah transisi, update field 'status' di ReportModel
//   dan simpan via report_repository.dart ke SQLite.
// =============================================================
