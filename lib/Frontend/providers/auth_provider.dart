// =============================================================
// FILE   : lib/Frontend/providers/auth_provider.dart
// TEKNIK : Automata (Finite State Machine) + Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Mengelola state autentikasi pengguna menggunakan FSM.
//   Setiap perubahan state hanya boleh melalui transisi yang valid.
//
// STATE (AuthState enum) :
//   unauthenticated → loading → authenticated
//                          ↘→ error → unauthenticated
//
// TRANSISI YANG VALID :
//   login()  : unauthenticated → loading → authenticated / error
//   logout() : authenticated   → unauthenticated
//   retry()  : error           → unauthenticated
//
// DEFENSIVE :
//   Tambahkan assert di setiap method transisi:
//   assert(state == AuthState.unauthenticated, 'login() hanya dari UNAUTHENTICATED')
//
// INTEGRASI :
//   Panggil auth_service.dart untuk operasi Firebase Auth.
//   UI listen ke state ini untuk tampilkan loading/error/home.
// =============================================================
