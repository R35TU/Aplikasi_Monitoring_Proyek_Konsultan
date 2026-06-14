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
