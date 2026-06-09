import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_model.dart';
import '../supabase/supabase_client.dart';

class AuthService {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  AuthService() {
    _initAuthStateListener();
  }

  void _initAuthStateListener() {
    supabase.auth.onAuthStateChange.listen((data) async {
      final Session? session = data.session;
      if (session != null) {
        final userId = session.user.id;
        final response = await supabase.from('users').select().eq('firebase_uid', userId).maybeSingle();
        if (response != null) {
          _currentUser = UserModel.fromJson(response, session.user.email ?? '');
        }
      } else {
        _currentUser = null;
      }
    });
  }

  Future<void> seedDefaultUser() async {
    // Seeding is now handled via Supabase Dashboard directly
  }

  Future<UserModel?> signIn(String email, String password) async {
    assert(email.isNotEmpty, 'Email tidak boleh kosong');
    assert(password.isNotEmpty, 'Password tidak boleh kosong');

    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final user = res.user;
      if (user != null) {
        final response = await supabase.from('users').select().eq('firebase_uid', user.id).maybeSingle();
        if (response != null) {
          _currentUser = UserModel.fromJson(response, user.email ?? '');
          return _currentUser;
        } else {
          // If no custom user data, just return a default
          _currentUser = UserModel(id: user.id, name: 'User', email: user.email ?? '', role: 'client');
          return _currentUser;
        }
      }
      return null;
    } catch (e) {
      throw Exception("Gagal login: $e");
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    _currentUser = null;
  }
}
