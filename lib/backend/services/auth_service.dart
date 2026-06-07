// =============================================================
// FILE   : lib/backend/services/auth_service.dart
// TEKNIK : API (Mock)
// =============================================================

import 'package:drift/drift.dart' as drift;
import '../database/app_database.dart';

class AuthService {
  final AppDatabase db;
  User? _currentUser;

  AuthService(this.db);

  User? get currentUser => _currentUser;

  /// Tanam data user awal (admin) jika database masih kosong
  Future<void> seedDefaultUser() async {
    final userCount = await db.select(db.users).get();
    if (userCount.isEmpty) {
      await db.into(db.users).insert(
        UsersCompanion.insert(
          firebaseUid: 'usr-admin-001',
          nama: 'Administrator',
          username: const drift.Value('admin'),
          peran: 'super_admin',
        ),
      );
    }
  }

  Future<User?> signIn(String username, String password) async {
    assert(username.isNotEmpty, 'Username tidak boleh kosong');
    assert(password.isNotEmpty, 'Password tidak boleh kosong');

    try {
      // Mock login check against SQLite Users table
      final user = await (db.select(db.users)..where((tbl) => tbl.username.equals(username))).getSingleOrNull();
      
      if (user != null && password == 'admin123') { // Hardcoded password for mock
        _currentUser = user;
        return user;
      } else {
        throw Exception("Username atau Password salah");
      }
    } catch (e) {
      throw Exception("Gagal login: $e");
    }
  }

  Future<void> signOut() async {
    _currentUser = null;
  }
}
