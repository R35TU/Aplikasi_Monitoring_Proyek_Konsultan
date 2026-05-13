// =============================================================
// FILE   : lib/Frontend/providers/upload_provider.dart
// TEKNIK : Automata (Finite State Machine) + Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Mengelola state proses upload foto lapangan menggunakan FSM.
//
// STATE (UploadState enum) :
//   idle → picking → uploading → success
//                ↘→ failed → idle (retry)
//
// TRANSISI YANG VALID :
//   pickPhoto()   : idle      → picking
//   startUpload() : picking   → uploading
//   onSuccess()   : uploading → success
//   onFailed()    : uploading → failed
//   reset()       : success / failed → idle
//
// DEFENSIVE :
//   assert(state == UploadState.idle, 'pickPhoto() hanya dari IDLE')
//   Jangan allow upload kalau state bukan picking.
//
// INTEGRASI :
//   startUpload() memanggil storage_service.dart untuk upload ke Firebase.
//   URL hasil upload disimpan ke ReportModel.photoPath.
// =============================================================
