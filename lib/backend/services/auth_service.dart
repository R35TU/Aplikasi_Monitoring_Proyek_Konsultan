import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_model.dart';

class AuthService {
  // 1. Singleton Pattern
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  final SupabaseClient _supabase = Supabase.instance.client;

  Future<UserModel?> signIn(String email, String password) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    
    final user = response.user;
    if (user != null) {
      // Ambil data user dari tabel users jika ada
      final userData = await _supabase
          .from('users')
          .select()
          .eq('user_id', user.id)
          .maybeSingle();
          
      if (userData != null) {
        return UserModel(
          userId: user.id,
          nama: userData['nama'] ?? 'Unknown',
          username: userData['username'],
          peran: userData['peran'] ?? 'User',
          perusahaanId: userData['perusahaan_id'],
          nomorHp: userData['nomor_hp'],
        );
      }
      
      return UserModel(
        userId: user.id,
        nama: user.email ?? 'Unknown',
        peran: 'User',
      );
    }
    return null;
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
