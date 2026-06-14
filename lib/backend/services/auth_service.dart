// =============================================================
// FILE   : lib/backend/services/auth_service.dart
// TEKNIK : API
// -------------------------------------------------------------
// FUNGSI :
//   Menangani semua operasi autentikasi menggunakan
//   Firebase Authentication SDK.
//   Perantara antara auth_provider.dart (FSM) dan Firebase Auth.
//
// METHOD YANG PERLU DIBUAT :
//   - signIn(email, password)  : login, return UserCredential
//   - signOut()                : logout
//   - resetPassword(email)     : kirim email reset password
//   - getCurrentUser()         : ambil user yang sedang login
//   - authStateChanges()       : Stream<User?> untuk listen status login
//
// CARA PAKAI :
//   import 'package:firebase_auth/firebase_auth.dart';
//   final _auth = FirebaseAuth.instance;
//
// DEFENSIVE :
//   Wrap setiap call Firebase dengan try-catch FirebaseAuthException.
//   Validasi email tidak kosong sebelum memanggil API.
// =============================================================

class AuthService {
  // 1. Singleton Pattern
  // Memastikan AuthService hanya memiliki satu instance di seluruh aplikasi.
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal() {
    // Inisialisasi Firebase Auth (contoh)
    // _auth = FirebaseAuth.instance;
  }

  // Dummy methods untuk contoh
  void signIn(String email, String password) {}
  void signOut() {}
}
