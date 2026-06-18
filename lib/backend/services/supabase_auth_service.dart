import 'package:supabase_flutter/supabase_flutter.dart';

// 1. Prinsip SOLID (Single Responsibility Principle) & Clean Architecture (Data Layer)
// Kelas ini HANYA bertanggung jawab untuk berinteraksi dengan Supabase Authentication.
// Logika UI (seperti menampilkan loading atau error) dipisahkan dari proses autentikasi murni.
class SupabaseAuthService {
  final SupabaseClient _client = Supabase.instance.client;

  // 2. Aturan Penamaan (Naming Convention)
  // - Method menggunakan camelCase (signIn)
  // - Parameter menggunakan camelCase (email, password)
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }
}
